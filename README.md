# AllTasksPDF

For use by the Bebras community. Provides a way, through *Github Actions*, 
to produce a single PDF `all-tasks.pdf` with all tasks contained in a repository folder.

## Details

The script processes *all top level folders* in this repository independently.

Each top level folder is assumed to contain a set of task (sub)folders with names that conform to a
strict pattern (see below). The script then produces a PDF file `all-tasks.pdf` in that top level folder.
(Top level folders that already contain a file `all-tasks.pdf` are not processed.)

Task folders must follow the Bebras task folder naming conventions: 'year dash country dash number dash underscore title',
(i.e., 'Bebras-id underscore title'),
e.g. `2024-BE-01a_Castles`, `2025-UK-17_Vote_later`. Within that task folder the script
will process all files whose names start with the Bebras ID of that
folder and end in `.odt` or `.html`, e.g., `2024-BE-01a-eng.html` 
but also `2024-UK-17_version1.odt`.

The tasks in the resulting file will be sorted by task folder name.

## First time setup

Make a (private) fork of this repository on *github.com*. Use the forked repository in what follows.

Ensure *Github Actions* have write access to the forked repository: on *github.com* use
*Settings* → *Actions* → **TODO**

## Usage

Commit and push the tasks to a new top level folder in your repository

Run the action **TODO**

If all goes well, the top level folder will now contain a file `all-tasks.pdf`.

To rerun the action on the same folder, e.g., when some tasks were changed or added, first remove
the file `all-tasks.pdf` from that folder and run the action again as described above.

## Notes
The script probably does not handle exceptional situations very well. Hence
* Do not use folder or file names that contain spaces
* Avoid folders without task folders
* Use only one ODT and/or HTML file per task folder


