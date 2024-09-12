# Smart Home UI

This project is a Flutter application that demonstrates a simple Smart Home UI. It allows users to control various home appliances through a mobile interface.

## Project Structure

The project consists of the following main components:

1. `HomePage`: The main screen of the application.
2. `HomeApplianceTile`: A widget representing each smart home device.
3. `HomeAppliance`: A model class for smart home devices.

### HomePage

The `HomePage` is the main screen of the application. It displays a list of smart home devices in a grid layout. Key features include:

- AppBar with a title and icons
- Welcome message
- Grid of smart home devices

### HomeApplianceTile

The `HomeApplianceTile` is a custom widget that represents each smart home device. It displays:

- An emoji representing the device
- The name of the device
- A switch to toggle the device on/off

The appearance of the tile changes based on whether the device is on or off.

### HomeAppliance

The `HomeAppliance` class is a model representing a smart home device. It contains:

- `imageAsset`: An emoji representing the device
- `name`: The name of the device
- `isOnOrOff`: A boolean indicating whether the device is on or off

## Usage

To use this application:

1. Ensure you have Flutter installed on your machine.
2. Clone this repository.
3. Run `flutter pub get` to install dependencies.
4. Run the app using `flutter run`.

## Customization

You can easily customize the list of smart home devices by modifying the `listOfHomeAppliance` in the `HomePage` class. Add or remove `HomeAppliance` objects as needed.

## Note

This project currently does not persist the state of the devices when the app is closed. If you want to implement state persistence, consider using a state management solution or local storage option like Hive or SharedPreferences.

## Future Improvements

- Implement state persistence for device status
- Add more customization options for devices
- Implement actual functionality for controlling real smart home devices

Feel free to contribute to this project by submitting pull requests or opening issues for any bugs or feature requests.
