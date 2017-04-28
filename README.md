# hoffman2Scripts
Run [my analysis](https://github.com/anitaNeutrino/anitaAnalysisTools) on the [Hoffman2 cluster](https://www.hoffman2.idre.ucla.edu/).

## Important notes

### Compiling
I compile my software on the login nodes, but they get run on the job nodes.
Compiling with ```-march=native ``` will tell the compiler to use instruction set for the processor on the head nodes.
That code will then not run on any of the job nodes (unless the processor chipsets are identical, which they don't seem to be).
As far as this concerns the ANITA software, you need to run 
```bash
cd /path/to/anitaBuildTool
cmake CMakeLists.txt
make configure
```
Then set ```VECTORIZE=OFF```, this should work, at least until I tweak [Cosmin's](https://github.com/cozzyd) compile options to try and separate the two settings.


### Debugging
[Hoffman2](https://www.hoffman2.idre.ucla.edu/) has [a wiki page maintained by the Center for Cognative Neuroscience](https://www.ccn.ucla.edu/wiki/index.php/Hoffman2).
One particularly useful command I found on the wiki, when run on the login nodes, will quickly drop you into an interactive shell on a job node.
```bash
qrsh -l i,h_rt=4:00:00 -now no
```
