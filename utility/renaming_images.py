import pathlib
import sys,os
import shutil

current_dir = pathlib.Path(__file__).parent

for root,dirname,files in os.walk(current_dir):   
     for i in files:    
        #print filename  
        path = str(root+"\\"+str(i))
        os.rename(path, root +"_" +i)