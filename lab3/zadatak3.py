#!/usr/bin/env python

import os;
import re;
import sys;

def main():
  """funkcija main"""
  studenti = dict();

  student = open( "studenti.txt", "r" );

  for s in student:
    data = s.strip().split();
    studenti[ data[0] ] = dict();
    studenti[ data[0] ][ 'ime' ] = data[1];
    studenti[ data[0] ][ 'prezime' ] = data[2];

  student.close();

  L = set();

  labosi = os.listdir(".");

  for lab in labosi:
    m = re.match( r"Lab_([0-9]{2})_g([0-9]{2}).txt", lab );
    if m:
      grupa = m.group(1);
      L.add( grupa );

      labos = open( lab, "r" );
      for unos in labos:
        data = unos.strip().split();
        if grupa in studenti[ data[0] ]:
          print ("Preklapanje kod labosa", lab);
          sys.exit(1);
        
        studenti[ data[0] ][ grupa ] = data[1];

      labos.close();
  

  print ("%10s %10s %10s" % ("JMBAG", "Ime,", "Prezime"), end='');
  for lab in L:
    print ("%5s" % lab, end='');
  print ("");

  for stud in studenti.keys():
    print ("%10s %10s, %10s" % ( stud, studenti[stud]['ime'], studenti[stud]['prezime'] ), end='' );
    for lab in L:
      print ("%5s" % studenti[stud].get( lab, 0 ), end='');
    print ("");


  return 0;

if __name__ == '__main__':
  main()  
