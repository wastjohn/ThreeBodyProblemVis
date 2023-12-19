# ThreeBodyProblemVis

This repo holds the code for creating a visualization of the Three Body Problem for Macalester's MATH 312 final project, created by Caedan Miller, Kiki Murphy, and Will St. John.

## File Organization

This repo is organized as follows:

- Animation
  - ThreeBodyAnim.py  -  script for animating plots without Turtle
  - ThreeBodyTurtle.py  -  script for animating plots with Turtle (shown in Presentation)
- Mass
  - Earth-moon-sun.ipynb  -  python notebook modeling Earth, Sun, and Moon
  - MassExperiments.py  -  script for 
  - MassVerification.ipynb
  - testing.ipynb
- Paper
  - Images
  - FinalPaper.pdf
  - FinalPaper.tex
- Proposal
  - Proposal.pdf
  - Proposal.tex
- Visualizations
  - ThreeBodyVis.ipynb
  - ThreeBodyVis.py

## What should I look at?

If you are *looking for the code that created the plots shown in our presentation*, look at `ThreeBodyVis.ipynb` in the `Visualizations/` directory.

If you are *looking for the final paper* or the *images used in the final presentation*, look at `FinalPaper.tex` or `FinalPaper.pdf` in the `FinalPaper/` directory.

## How can I make my own plots?

The python script `ThreeBodyVis.py` in the `Visualization/` directory can be imported to create plots of the Three Body Problem using Heun's method. The following 

```{python}
import Visualizations.ThreeBodyVis as tbv
import matplotlib.pyplot as plt

plt.figure(1, figsize=(10, 10))  # define the figure object for the 2x2 grid
tbv.make_vis(221, 1, 'Perturbations')  # create the first plot in the 2x2 grid, with 1 perturbation, titled 'Perturbations'
tbv.make_vis(222, 2, 'Perturbations 2')  # create the second plot in the 2x2 grid, with 2 perturbations, titled 'Perturbations 2'
tbv.generate_avg(2, 223, 3000, 0.001)  # create the third plot in the 2x2 grid, with 2 perturbation, averaged together
tbv.generate_avg(4, 224, 3000, 0.001)  # create the fourth plot in the 2x2 grid, with 4 perturbations, averaged together
plt.show()

# it may take a while depending on the stepsizes and number of perturbations you choose

```
