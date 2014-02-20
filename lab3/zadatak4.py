#!/usr/bin/env python

import re;
import urllib.request;
import sys;

def main():
  """funkcija main"""

  url = "http://python.org";
  if len(sys.argv) == 2:
    url = sys.argv[1];

  stranica = urllib.request.urlopen( url );
  stranica_byte = stranica.read();
  content = stranica_byte.decode( "utf8" );

  hosts = set();
  count = dict();

	#stranica
  
  print( content );
  

  #linkovi
  print ("Links: ");
  links = re.findall( r'href="(.+?)"', content );
  for link in links:
    print ("\t" + link);
    m = re.match( r'http://([\w\.-]+)', link );
    if m:
      hosts.add( m.group(0) );
      if m.group(0) in count:
        count[ m.group(0) ] += 1;
      else:
        count[ m.group(0) ] = 1;
  
  
  #hostova
  print ("Hosts: ");
  for host in hosts:
    print(host);
  #broj referenci
  print ("Broj referenci: ");
  for k in count.keys():
    print ("%s %d" % ( k, count[k] ));
  #email
  email = re.findall( r'[\w_\.-]+@[\w\.-]+', content );
  print ("Email: ");
  print (len( email ), email);
  #linkovi na slike
  slike = re.findall( r'<img src="(.*?)"', content );
  print ("Slike: ");
  print (len( slike ));
  #print ( slike );

  return 0;

if __name__ == '__main__':
  main()  

