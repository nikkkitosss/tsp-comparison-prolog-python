distances = {
  ('a', 'b'): 10,
  ('a', 'c'): 15,
  ('a', 'd'): 20,
  ('b', 'c'): 35,
  ('b', 'd'): 25,
  ('c', 'd'): 30
}

def get_distance(city1, city2):
  if (city1, city2) in distances:
    return distances[(city1, city2)]
  return distances[(city2, city1)]

def tsp_nearest_neighbor(cities, distances, start):
  unvisited = cities.copy()
  current = start
  path = [current]
  unvisited.remove(current)
  total_distance = 0
  
  while unvisited:
    nearest = None
    min_distance = float('inf')
    
    for city in unvisited:
      dist = get_distance(current, city)
      if dist < min_distance:
        min_distance = dist
        nearest = city
    
    path.append(nearest)
    total_distance += min_distance
    current = nearest
    unvisited.remove(nearest)
  
  total_distance += get_distance(current, start)
  return path, total_distance


cities = ['a', 'b', 'c', 'd']

start = 'a'

path, total_distance = tsp_nearest_neighbor(cities, distances, start)

print("Route:", path)
print("Total distance:", total_distance)

