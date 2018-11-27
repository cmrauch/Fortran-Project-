#include <iostream>
#include <ctime>

using namespace std;

const int columns = 10;
const int rows = 10;
void printMat(int mat[][columns], int rows, int columns);

int main()
{
	cout << "========== c++ ==========\n";
	clock_t start;
	//int rows = 10;
	//int columns = 10;
	int a[rows][columns], 
	    b[rows][columns], 
	    c[rows][columns];
	start = clock();
	    
	//init a
	for(int i=0; i<rows; ++i)
	  for(int j=0; j<columns; ++j)
	    a[i][j] = i + j;	
	cout << "A matrix initialized...\n";
	  
	//init b
	for(int i=0; i<rows; ++i)
	  for(int j=0; j<columns; ++j)
	    b[i][j] = i + j;  	    
	cout << "B matrix initialized...\n";
	
	// multiply A and B
	cout << "Matrix A and B are being multiplied...\n";
	for(int i = 0; i<rows; ++i)
	{
		for(int j=0; j<columns; ++j)
		{
			c[i][j] = 0; 
            for (int k = 0; k<columns; ++k) 
                c[i][j] += a[i][k] * b[k][j];
		}
	}
	
	//print results
	printMat(c,rows,columns);
	
	cout << "Time spent running algorithm:" 
	     <<((clock()-start)/double CLOCKS_PER_SEC)<< " seconds\n\n";
	return 0;
}

void printMat(int mat[][columns],int rows, int columns)
{
	for(int i=0; i<rows; ++i)
	{
		cout << "   ";
	  for(int j=0; j<columns; ++j)
	  {
	    cout << mat[i][j] << " ";
	  }
	  cout << endl;
	}
}

