from shutil import copyfile

import fastoad.api as oad
import os.path as pth


def run_fastoad(STATE):
    conf_file = pth.join(pth.dirname(__file__), "oad_process_INRIA.yml")
    conf = oad.FASTOADProblemConfigurator(conf_file)
    problem = conf.get_problem(read_inputs=True)
    problem.setup()

    if pth.exists(problem.output_file_path):
        variables = oad.DataFile(problem.output_file_path)
        for variable in variables:
            if variable.is_input is not None:
                problem.set_val(variable.name, variable.value, variable.units)

    problem["data:geometry:wing:MAC:at25percent:x"] = STATE["wing_position"]
    problem["data:geometry:wing:aspect_ratio"] = STATE["wing_aspect_ratio"]
    problem["data:geometry:wing:virtual_taper_ratio"] = STATE["wing_taper_ratio"]
    problem["data:geometry:wing:sweep_25"] = STATE["wing_sweep"]
    problem["data:geometry:horizontal_tail:aspect_ratio"] = STATE["horizontal_tail_aspect_ratio"]
    problem["data:propulsion:MTO_thrust"] = STATE["max_thrust"]

    problem.run_model()
    problem.write_outputs()

    STATE["span"] = problem["data:geometry:wing:span"]
    STATE["static_margin"] = problem["data:handling_qualities:static_margin"]
    STATE["block_fuel"] = problem["data:mission:sizing:needed_block_fuel"]
    STATE["OWE"] = problem["data:weight:aircraft:OWE"]
    STATE["climb_duration"] = problem["data:mission:sizing:main_route:climb:duration"]
