void makeIt(int run){
  UCorrelator::SpectrumAverage avg(run);
}


void makeUCorrAvePowSpec(){

  
  gSystem->Load("libUCorrelator.so");  
  const char* sgeTaskId = "SGE_TASK_ID";
  const char* sgeTaskIdEnv = getenv(sgeTaskId);
  if(!sgeTaskIdEnv){
    std::cerr << "Couldn't find environment variable " << sgeTaskId << "! Giving up!" << std::endl;
    return;
  }
  int run = atoi(sgeTaskIdEnv);
  makeIt(run);
  gROOT->ProcessLine(".q");
}
