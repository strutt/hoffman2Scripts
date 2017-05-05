
# A script to compile the anita software for the specific architecture of this node
node=$(uname -n)
if [[ $node == *"login"* ]]; then
    echo "Don't run this on the login node!"
    exit;
fi;
arch=$(qhost | grep $node | cut -c25-39 | sed "s, ,,g")
echo "I think the architecture for node "$node" is "$arch
export ANITA_UTIL_INSTALL_DIR=~/Repositories/Install/$arch
echo "I exported ANITA_UTIL_INSTALL_DIR="$ANITA_UTIL_INSTALL_DIR

buildToolDir=~/Repositories/anitaBuildTool

# Create a build directory
compileDir=$ANITA_UTIL_INSTALL_DIR/build
mkdir -p ${compileDir}

# Create the makefiles
cd ${compileDir}
ln -fs ${buildToolDir}/components/libRootFftwWrapper/cmake ./
cmake ~/Repositories/anitaBuildTool

# Compile and install the project
make && make install

# Create a file in the ~/compiledArches dir
# This file gets deleted just before the compiling batch jobs are started...
touch ~/compiledArches/${arch}
