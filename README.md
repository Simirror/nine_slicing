# Nine Slicing

A Flutter package that implements nine-slice scaling functionality similar to the Unity engine. Through nine-slice scaling technology, images can be scaled without distortion, making it particularly suitable for creating UI borders, button backgrounds, and other interface elements.

## Features

- Supports nine-slice image scaling
- Maintains corner image quality without distortion
- Customizable slice sizes for all four sides
- Supports background color settings
- Supports padding adjustments

## Installation

Add this dependency to your project's `pubspec.yaml` file:

```yaml
dependencies:
  nine_slicing: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## Usage

1. Import the package:

```dart
import 'package:nine_slicing/nine_slicing.dart';
```

2. Use the `NineSliceImage` widget:

```dart
NineSliceImage(
  imagePath: 'assets/panel-border-001.png',
  width: 200,
  height: 100,
  leftSlice: 10,
  rightSlice: 10,
  topSlice: 10,
  bottomSlice: 10,
  backgroundColor: Colors.black,
  padding: 0,
)
```

## API Documentation

### NineSliceImage

| Parameter | Type | Description | Default |
|------|------|------|--------|
| imagePath | String | Local image asset path | Required |
| width | double | Width of the rendered image | Required |
| height | double | Height of the rendered image | Required |
| leftSlice | double | Width of the left slice (pixels) | 10.0 |
| rightSlice | double | Width of the right slice (pixels) | 10.0 |
| topSlice | double | Height of the top slice (pixels) | 10.0 |
| bottomSlice | double | Height of the bottom slice (pixels) | 10.0 |
| backgroundColor | Color | Background color | Colors.black |
| padding | double | Padding between image and background | 0.0 |

## Example

Check out the [example](example) directory for a complete example.

## Contributing

Issues and Pull Requests are welcome!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
