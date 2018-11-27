#include <iostream>
#include <ctime>

using namespace std;

int main()
{
	int a = 10000;
	int b = 10000;
	int c =0;
	clock_t start;
	
	start = clock();
	for(int i = 0; i<1000000000; ++i)
	  c = a*b;
	cout << "Time taken for 'cout' statement:" 
	     <<((clock()-start)/double CLOCKS_PER_SEC)<< " seconds\n";
	return 0;
}
