# Better ktlint workflow

Specially if you are working on legacy code and you don't want to lint your entire project, it's very useful to have control over your linting process and select which files to be linted. The scripts installed from this project do the following:

- **Git _pre-commit_ hook**
    - Track the *kotlin* files that are being commited
    - Prompt you with the choice of staging those files so you can lint format them later
- **Script** `lint-staged-files`
    - Lint format all staged files
    - After lint formatting, unstage those files
> **Note:** Trying to lint a file with uncommited changes will prompt you with a warning message. It's best not to mix changes related to linting with non related ones. This script is ment to be used right before pushing, so you can end the workflow with linting.
- **Git _pre-push_ hook**
    - Checks if there are staged files for linting
    - Prompt you with the choice of linting them now (and calls `lint-staged-files` script)

# Instalation

``` shell
chmod +x install.sh
./install.sh <your-git-directory>
```
