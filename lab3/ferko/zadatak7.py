#! /usr/bin/env python3.2

import sys
import re

def main():
  """main function"""

  if len( sys.argv ) != 2:
    print( "Pogresan broj argumenata" );
    print( "usage: ./zadatak7.py <arg1>" );
    sys.exit( 1 );

  try:
    with open( sys.argv[1], 'r' ) as dat:
      lines = dat.readlines();
      for l in lines:
        line = l.strip();

        m = re.findall( r'<LI> (.*?), <I>(.*?)</I>, (.*?), ([0-9]{4}) \((.*?)\)</LI>', line );
      
        if m:
          
          author = m[0][0];
          title = m[0][1];
          label = m[0][4];
          publisher = m[0][2];
          year = m[0][3];
          
          print(
              '@book{%s,\n\tauthor = "%s",\n\ttitle = "%s",\n\tpublisher = "%s",\n\tyear = "%s"\n}\n'
              % ( label, author, title, publisher, year ));


  except Exception:
    print( "Pogreska pri radu s datotekom" );

  return;

if __name__ == '__main__':
  main()
