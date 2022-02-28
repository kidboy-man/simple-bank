#!/bin/bash
GIT_DIR=$(git rev-parse --git-dir)
echo "Installing pre-push..."
echo "#!/bin/bash\nsh scripts/pre-push.bash" > $GIT_DIR/hooks/pre-push
chmod +x $GIT_DIR/hooks/pre-push
echo "Done"!