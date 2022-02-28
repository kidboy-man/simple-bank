#!/bin/bash
GIT_DIR=$(git rev-parse --git-dir)
echo "Installing hooks..."
echo "#!/bin/bash\nsh scripts/pre-commit.bash" > $GIT_DIR/hooks/pre-commit
chmod +x $GIT_DIR/hooks/pre-commit
echo "Done"!