#include<iostream>
#include<cuda.h>
#include"cuda_runtime.h"
#include<Windows.h>

using namespace std;

const int Length = 9;

__global__ void Kernel(char *Strd,int *Startd,int *Stopd,char *Finald){
	int tx=threadIdx.x;
	int t=tx*3;
	__shared__ char Strs[Length];
	for(int i=0;i<3;i++){
		Strs[t+i]=Strd[t+i];
	}
	for(int j=0;j<3;j++){
		if(Strs[t+j]=='a'&&Strs[t+1+j]=='t'&&Strs[t+2+j]=='g'){
			Startd[j]=t+2;
		}
		if((Strs[t+j]=='t'&&Strs[t+1+j]=='a'&&Strs[t+2+j]=='g')||(Strs[t+j]=='t'&&Strs[t+1+j]=='a'&&Strs[t+2+j]=='a')||(Strs[t+j]=='t'&&Strs[t+1+j]=='g'&&Strs[t+2+j]=='a')){
			Stopd[j]=t;
		}
		if((Startd[j]<t)&&(Stopd[j]>=t)){
 			if(Strs[t+j]=='c'&&Strs[t+1+j]=='t'&&(Strs[t+2+j]=='c'||Strs[t+2+j]=='t'||Strs[t+2+j]=='a'||Strs[t+2+j]=='g')){
				Finald[t+j]='R';
			}
 			if(Strs[t+j]=='c'&&Strs[t+1+j]=='a'&&(Strs[t+2+j]=='a'||Strs[t+j+2]=='g')){
				Finald[t+j]='Q';
			}
 			if(Strs[t+j]=='c'&&Strs[t+j+1]=='a'&&(Strs[t+j+2]=='t'||Strs[t+j+2]=='c')){
				Finald[t+j]='H';
			}
 			if(Strs[t+j]=='c'&&Strs[t+j+1]=='c'&&(Strs[t+j+2]=='c'||Strs[t+j+2]=='t'||Strs[t+j+2]=='a'||Strs[t+j+2]=='g')){
				Finald[t+j]='P';
			}
 			if(Strs[t+j]=='c'&&Strs[t+j+1]=='u'&&(Strs[t+j+2]=='c'||Strs[t+j+2]=='t'||Strs[t+j+2]=='a'||Strs[t+j+2]=='g')){
				Finald[t+j]='L';
			}
 			if(Strs[t+j]=='t'&&Strs[t+j+1]=='g'&&Strs[t+j+2]=='g'){
				Finald[t+j]='W';
			}
 			if(Strs[t+j]=='t'&&Strs[t+j+1]=='a'&&(Strs[t+j+2]=='a'||Strs[t+j+2]=='c')){
				Finald[t+j]='C';
			}
 			if(Strs[t+j]=='t'&&Strs[t+j+1]=='a'&&(Strs[t+j+2]=='u'||Strs[t+j+2]=='c')){
				Finald[t+j]='Y';
			}
 			if(Strs[t+j]=='t'&&Strs[t+j+1]=='c'&&(Strs[t+j+2]=='c'||Strs[t+j+2]=='t'||Strs[t+j+2]=='a'||Strs[t+2]=='g')){
				Finald[t+j]='S';
			}
 			if(Strs[t+j]=='t'&&Strs[t+j+1]=='t'&&(Strs[t+j+2]=='a'||Strs[t+j+2]=='g')){
				Finald[t+j]='L';
			}
 			if(Strs[t+j]=='t'&&Strs[t+j+1]=='t'&&(Strs[t+j+2]=='u'||Strs[t+j+2]=='c')){
				Finald[t+j]='F';
			}
 			if(Strs[t+j]=='g'&&Strs[t+j+1]=='g'&&(Strs[t+j+2]=='c'||Strs[t+j+2]=='t'||Strs[t+j+2]=='a'||Strs[t+j+2]=='g')){
				Finald[t+j]='G';
			}
 			if(Strs[t+j]=='g'&&Strs[t+j+1]=='a'&&(Strs[t+j+2]=='a'||Strs[t+j+2]=='g')){
				Finald[t+j]='E';
			}
 			if(Strs[t+j]=='g'&&Strs[t+j+1]=='a'&&(Strs[t+j+2]=='u'||Strs[t+j+2]=='c')){
				Finald[t+j]='D';
			}
 			if(Strs[t+j]=='g'&&Strs[t+j+1]=='c'&&(Strs[t+j+2]=='c'||Strs[t+j+2]=='t'||Strs[t+j+2]=='a'||Strs[t+j+2]=='g')){
				Finald[t+j]='A';
			}
 			if(Strs[t+j]=='g'&&Strs[t+j+1]=='t'&&(Strs[t+j+2]=='c'||Strs[t+j+2]=='t'||Strs[t+j+2]=='a'||Strs[t+j+2]=='g')){
				Finald[t+j]='V';
			}
 			if(Strs[t+j]=='a'&&Strs[t+j+1]=='g'&&(Strs[t+j+2]=='g'||Strs[t+j+2]=='a')){
				Finald[t+j]='r';
			}
 			if(Strs[t+j]=='a'&&Strs[t+j+1]=='g'&&(Strs[t+j+2]=='c'||Strs[t+j+2]=='t')){
				Finald[t+j]='S';
			}
 			if(Strs[t+j]=='a'&&Strs[t+j+1]=='a'&&(Strs[t+j+2]=='g'||Strs[t+j+2]=='a')){
				Finald[t+j]='K';
			}
 			if(Strs[t+j]=='a'&&Strs[t+j+1]=='a'&&(Strs[t+j+2]=='c'||Strs[t+j+2]=='t')){
				Finald[t+j]='N';
			}
 			if(Strs[t+j]=='a'&&Strs[t+j+1]=='c'&&(Strs[t+j+2]=='c'||Strs[t+j+2]=='t'||Strs[t+j+2]=='a'||Strs[t+j+2]=='g')){
				Finald[t+j]='T';
			}
 			if(Strs[t+j]=='a'&&Strs[t+j+1]=='t'&&(Strs[t+j+2]=='c'||Strs[t+j+2]=='t'||Strs[t+j+2]=='a')){
				Finald[t+j]='I';
			}
		}
	}
	for(int i=0;i<3;i++){
		Strd[t+i]=Strs[t+i];
	}
//	Finald[t]='a'+t;
}

int main(){
	char Str[Length],Final[Length],*Strd,*Finald;
	int Start[3],Stop[3],*Startd,*Stopd;
	for(int i=0;i<Length;i++){
		cin>>Str[i];
		Final[i]='a'+i;
	}
	for(int i=0;i<3;i++){
		Start[i]=i;
		Stop[i]=i;
	}
	dim3 dimBlock(Length/3,1);
	dim3 dimGrid(1,1);
	cudaMalloc((void**)&Strd,Length*sizeof(char));
	cudaMalloc((void**)&Startd,3*sizeof(int));
	cudaMalloc((void**)&Stopd,3*sizeof(int));
	cudaMalloc((void**)&Finald,Length*sizeof(char));
	cudaMemcpy(Strd,Str,Length*sizeof(char),cudaMemcpyHostToDevice);
	Kernel<<<dimGrid,dimBlock>>>(Strd,Startd,Stopd,Finald);
	cudaMemcpy(Final,Finald,Length*sizeof(char),cudaMemcpyDeviceToHost);
	cudaMemcpy(Start,Startd,3*sizeof(int),cudaMemcpyDeviceToHost);
	cudaMemcpy(Stop,Stopd,3*sizeof(int),cudaMemcpyDeviceToHost);
	cudaMemcpy(Str,Strd,Length*sizeof(char),cudaMemcpyDeviceToHost);
	for(int i=0;i<3;i++){
		cout<<Start[i]<<"	"<<Stop[i]<<endl;
	}
	for(int i=0;i<Length;i++){
		cout<<Str[i]<<" - "<<i<<endl;
		cout<<Final[i]<<" - "<<i<<endl;
	}
	system("pause");
	return 0;
}