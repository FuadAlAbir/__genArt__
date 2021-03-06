import java.util.*;

class polygon
{
  List <edge> e = new ArrayList <edge> ();
  List <PVector> v = new ArrayList <PVector> ();
  
  polygon() {}
  
  void addVertex(float x, float y)
  {
    PVector a = new PVector(x, y);
    int total = v.size();
    if(total > 0)
    {
      PVector prev = v.get(total - 1);
      edge e1 = new edge(prev, a);
      e.add(e1);
    }
    v.add(a);
  }
  
  void close()
  {
    int total = v.size();
    PVector last = v.get(total - 1);
    PVector first = v.get(0);
    edge e1 = new edge(last, first);
    e.add(e1);
  }
  
  void hankin()
  {
    for(int i = 0; i < e.size(); i++)
    {
      e.get(i).hankin();
    }
    
    for (int i = 0; i < e.size(); i++) {
      for (int j = 0; j < e.size(); j++) {
        if (i != j) {
          e.get(i).findEnds(e.get(j));
        }
      }
    }  }
  void show()
  {
    for(int i = 0; i < e.size(); i++)
    {
      e.get(i).show();
    }
  }
};
