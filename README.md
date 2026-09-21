# Robotica

This repository provides software tools and controllers for mobile robots. It includes Python code for managing communication with the [CoppeliaSim](https://www.coppeliarobotics.com/) robotic simulator, along with examples of wheeled robot control algorithms.

The contents of this repository can be downloaded and used as needed, although following the installation procedure below is recommended. The controllers are available as standalone Python scripts and interactive [Jupyter Notebooks](https://jupyter.org/). These notebooks can be run using a standard Jupyter server or through any compatible IDE (such as VS Code, PyCharm, or JupyterLab).

## Installation

### Prerequisites

Make sure you have [CoppeliaSim](https://www.coppeliarobotics.com/) installed and properly configured on your system following the official documentation for your operating system.

> [!NOTE]
> The instructions below use `pip`. If you use another environment or package manager (such as `conda`), please adapt the commands accordingly.

### Clone the Repository

Download the source code to your local machine and navigate into the project directory:

```bash
git clone https://github.com/jdlope/robotica.git
cd robotica
```

### Repository Package Setup

It is recommended to create and activate a virtual environment before installing the package:

```bash
# Create a virtual environment named .venv
python3 -m venv .venv

# Activate the virtual environment
source .venv/bin/activate

# Install the repository package in editable mode
pip install -e .
```

> [!NOTE]
> The `pip install -e .` command installs the package in editable mode (along with its required dependencies), meaning any local changes you make to your source code will immediately take effect without requiring a reinstallation.

### Notebook Environment (Optional)

If you plan to run the notebook examples using a local Jupyter server, install the `notebook` package into your active virtual environment:

```bash
pip install notebook
```

If you prefer using an integrated environment like VS Code or PyCharm, ensure your IDE is configured to use the created `.venv` virtual environment as its Python kernel/interpreter.

## How to Use

Start the CoppeliaSim simulator.

Open one of the scenes provided in this repository featuring the Pioneer 3-DX robot, or create a new scene containing this robot. If you create a custom scene, ensure the robot's script label is set to `PioneerP3DX`.

Open and review the `avoid` notebook or script, which demonstrates a minimal obstacle avoidance controller.

To execute the standalone script from the command line, run:

```bash
python avoid.py
```

The controller implements a rule-based heuristic strategy for obstacle avoidance. Note that distance thresholds may need fine-tuning for optimal performance; otherwise, the robot might become stuck near complex obstacles.

## License

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.
