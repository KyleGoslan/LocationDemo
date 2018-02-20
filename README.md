# LocationDemo

```swift
func randomCoordinates() -> CLLocationCoordinate2D {
  let coordinate = CLLocationCoordinate2D(latitude: Double(arc4random_uniform(180)) - 90, longitude: Double(arc4random_uniform(360)) - 180)
  return coordinate
}
```
