import os.path as pth

import fastoad.api as oad


def run_fastoad(STATE):
    conf_file = pth.join(pth.dirname(__file__), "oad_process_INRIA.yml")
    conf = oad.FASTOADProblemConfigurator(conf_file)
    problem = conf.get_problem(read_inputs=True)
    problem.setup()

    for name, value in STATE.items():
        if ":" in name:
            problem[name] = value

    problem["data:geometry:wing:MAC:at25percent:x"] = STATE["wing_position"]
    problem["data:geometry:wing:aspect_ratio"] = STATE["wing_aspect_ratio"]
    problem["data:geometry:wing:virtual_taper_ratio"] = STATE["wing_taper_ratio"]
    problem["data:geometry:wing:sweep_25"] = STATE["wing_sweep"]
    problem["data:geometry:horizontal_tail:aspect_ratio"] = STATE["horizontal_tail_aspect_ratio"]
    problem["data:propulsion:MTO_thrust"] = STATE["max_thrust"]
    problem["data:geometry:wing:area"] = STATE["wing_area"]

    problem.run_model()
    # problem.write_outputs()

    STATE["span"] = problem["data:geometry:wing:span"]
    STATE["static_margin"] = problem["data:handling_qualities:static_margin"]
    STATE["block_fuel"] = problem["data:mission:sizing:needed_block_fuel"]
    STATE["OWE"] = problem["data:weight:aircraft:OWE"]
    STATE["climb_duration"] = problem["data:mission:sizing:main_route:climb:duration"]
    STATE["approach_speed"] = problem["data:TLAR:approach_speed"]
    STATE["additional_fuel"] = problem["data:weight:aircraft:additional_fuel_capacity"]

    data = oad.DataFile(oad.VariableList.from_problem(problem))
    for variable in data:
        STATE[variable.name] = variable.value


if __name__ == "__main__":
    # Simple test for memory usage.
    for i in range(10):
        STATE = {
            "wing_position": 16.0,
            "wing_aspect_ratio": 9.5,
            "wing_taper_ratio": 0.3,
            "wing_sweep": 25,
            "horizontal_tail_aspect_ratio": 4.3,
            "max_thrust": 118000,
            "wing_area": 120.0,
        }
        run_fastoad(STATE)
