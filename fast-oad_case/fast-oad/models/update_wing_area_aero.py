"""
Computation of wing area following aerodynamic constraints
"""
#  This file is part of FAST-OAD_CS25
#  Copyright (C) 2022 ONERA & ISAE-SUPAERO
#  FAST is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <https://www.gnu.org/licenses/>.

import fastoad.api as oad
import numpy as np
import openmdao.api as om
from fastoad_cs25.models.loops.constants import (
    SERVICE_WING_AREA_LOOP_AERO,
)
from scipy.constants import g
from stdatm import Atmosphere


@oad.RegisterSubmodel(
    SERVICE_WING_AREA_LOOP_AERO, "fastoad.submodel.loops.wing.area.update.aero.inria"
)
class UpdateWingAreaAero(om.ExplicitComponent):
    """Computes wing area for having enough lift at required approach speed."""

    def setup(self):
        self.add_input("data:geometry:wing:area", val=np.nan, units="m**2")
        self.add_input("data:weight:aircraft:MLW", val=np.nan, units="kg")
        self.add_input("data:aerodynamics:aircraft:landing:CL_max", val=np.nan)

        # My plan is to not promote this variable and connect it by hand so that it foes not
        # appear in the output file as is but only as a constraints in the other component. We
        # could however give it a proper name.
        self.add_output("data:TLAR:approach_speed", units="m/s")

        self.declare_partials(of="*", wrt="*", method="fd")

    def compute(self, inputs, outputs, discrete_inputs=None, discrete_outputs=None):
        mlw = inputs["data:weight:aircraft:MLW"]
        max_cl = inputs["data:aerodynamics:aircraft:landing:CL_max"]
        wing_area_approach = inputs["data:geometry:wing:area"]

        rho_sl = Atmosphere(0.0).density

        stall_speed = np.sqrt(mlw * g / wing_area_approach / (0.5 * rho_sl * max_cl))
        approach_speed = stall_speed * 1.23

        outputs["data:TLAR:approach_speed"] = approach_speed
