#!/usr/bin/env python

import sys

class matrix(object):
  """klasa matrice"""
  def __init__(self):
    self.val = dict();
    self.n = -1
    self.m = -1

  def input(self, ulaz):
    """unos dimenzija i vrijednosti u rijetkom obliku"""
    n,m = ulaz.readline().strip().split();
    self.n = int(n);
    self.m = int(m);

    while 1:
      line = ulaz.readline().strip();
      if len(line) == 0:
        break;
      
      r,s,v = line.split();
      
      if int(r) < 1 or int(r) > self.n or int(s) < 1 or int(s) > self.m:
        print( "Indeks izvan dimenzije matrice!" );
        sys.exit(1);

      self.val[(int(r), int(s))] = int(v);

    return;

  def output(self, tip, izlaz):
    for i in range(1, self.n+1):
      for j in range( 1, self.m+1 ):
        if tip == "v":
          izlaz.write( "%3d" % ( self.val.get( (i,j), 0 ) ) );
        elif self.val.get( (i,j), 0 ):
          izlaz.write( "%d %d %d\n" % ( i, j, self.val[(i,j)] ) );

      if tip == "v":
        izlaz.write( "\n" );

    return;

  def __mul__(self, other):
    if self.m != other.n:
      print( "matrice moraju biti dimenzija n,m x m,k!" );
      sys.exit(1);

    result = matrix();
    result.n = self.n;
    result.m = other.m;

    for i in range(1, self.n+1):
      for j in range(1, other.m+1):
        result.val[(i,j)] = 0;
        for k in range(1, self.m+1 ):
          if (i,k) in self.val and (k,j) in other.val:
            result.val[(i,j)] += self.val[(i,k)] * other.val[(k,j)];
          

    return result;

    

def main():
  """main funkcija"""
  FILE_IN = open( "matrice.in", "r" );
  FILE_OUT = open( "matrice.out", "w" );
  a = matrix();
  b = matrix();
  a.input( ulaz=FILE_IN );
  b.input( ulaz=FILE_IN );

  c = a * b;

  c.output( "v", izlaz=sys.stdout );

  c.output( "q", izlaz=FILE_OUT );

  FILE_OUT.close();
  FILE_IN.close();

  return

if __name__ == '__main__':
  main()  
