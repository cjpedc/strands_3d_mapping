#include "ekz.h"

using namespace std;

int main(int argc, char **argv){
	printf("starting testing software2\n");
	string input = argv[1];

	Calibration * cal = new Calibration();
    cal->fx			= 1081.37;//525.0;				//Focal Length X
    cal->fy			= 1081.37;//525.0;				//Focal Length Y
    cal->cx			= 959.5;//319.5;				//Center coordinate X
    cal->cy			= 539.5;//239.5;				//Center coordinate Y
    cal->ds			= 1;                            //Depth scaling for camera
    cal->scale		= 5000;                         //Depth scaling in file due to discretization.

	FrameMatcher * matcher = new AICK();
	RGBDSegmentation * seg = new RGBDSegmentation();
	FeatureExtractor *  fe = new SurfExtractor();

	vector< RGBDFrame * > frames;
	for(int i = 25; i <= 95; i+=5){
		printf("adding a new frame\n");
		char rgbbuf[512];
		char depthbuf[512];
		sprintf(rgbbuf,"%s/RGB%.10i.png",input.c_str(),i);
		sprintf(depthbuf,"%s/Depth%.10i.png",input.c_str(),i);
		FrameInput * fi = new FrameInput(cal, string(rgbbuf) , string(depthbuf));
		frames.push_back(new RGBDFrame(fi,fe,seg));
	}

	for(unsigned int i = 1; i < frames.size(); i++){
		Transformation * t = matcher->getTransformation(frames.at(i-1),frames.at(i));
		t->show(false);
	}

	return 0;
}
