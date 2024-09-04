# iDog Project

**iDog** is an iOS application built using a **MVP (Model-View-Presenter)** and **Coordinator** design patterns to provide information about various dog breeds. It implements a modular and scalable architecture for ease of maintenance and testing.

## Key Features
- Fetches and displays a list of dog breeds.
- Shows a gallery of dog images for each breed.
- Handles asynchronous API requests and displays loading states and errors.

## Architecture Overview
- **MVP Pattern**: 
  - **Domain Models**: Represent the core data structures (`Breed`, `Dog`).
  - **Presenters**: Handle business logic and communicate between models and views.
  - **Views**: Display the data prepared by the presenter.
  - **Presentation Models**: Lightweight data containers passed to the views.

- **Coordinator Pattern**: Manages navigation, keeping the view controllers free of navigation logic.

- **Factories**: Construct and inject dependencies into views and presenters.

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/kmalkic/iDog.git
