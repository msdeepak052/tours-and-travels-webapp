# DK Tours and Travels - Java Web Application

##Flowchart

![Tours-Travels-Webapp-Flowchart](https://github.com/user-attachments/assets/655971c8-5ff7-40b9-838c-634b3a55c8b5)


A colorful, responsive tours and travels web application built with Java, Spring Boot, and Maven.

## Features

- 🎨 **Vibrant Color Theme**: Coral, teal, and yellow accent colors on white background
- 📱 **Fully Responsive**: Works on all device sizes
- ✨ **Modern UI Elements**:
  - Animated cards and buttons
  - Floating promotional badges
  - Testimonials with ratings
- 📋 **Key Pages**:
  - Home with featured destinations
  - Booking management
  - Special offers section
  - Customer testimonials

## Technology Stack

- **Backend**: Java 17, Spring Boot 3.1.0
- **Frontend**: 
  - Thymeleaf templates
  - Bootstrap 5.3.0
  - Font Awesome 6.4.0
- **Build Tool**: Maven
- **Styling**: Custom CSS with vibrant color scheme

## Image Requirements

Place these images in `src/main/resources/static/images/`:

| File                | Description                          | Recommended Dimensions |
|---------------------|--------------------------------------|------------------------|
| `logo.png`          | Company logo                         | 200x200px              |
| `banner.jpg`        | Hero banner image                    | 2000x800px             |
| `destination1.jpg`  | Featured destination (e.g., Paris)   | 800x600px              |
| `destination2.jpg`  | Featured destination (e.g., Bali)    | 800x600px              |
| `hero-travelers.png`| Happy travelers image                | 800x600px              |
| `testimonial1.jpg`  | Customer testimonial photo           | 200x200px              |
| `testimonial2.jpg`  | Customer testimonial photo           | 200x200px              |
| `testimonial3.jpg`  | Customer testimonial photo           | 200x200px              |
| `favicon.ico`       | Browser tab icon                     | 32x32px                |

## Color Scheme

```css
:root {
    --primary-color: #FF6B6B;  /* Vibrant coral */
    --secondary-color: #4ECDC4;  /* Teal */
    --accent-color: #FFE66D;  /* Sunny yellow */
    --dark-color: #292F36;  /* Dark slate */
    --light-color: #F7FFF7;  /* Off-white */
    --text-color: #333333;
}

```

## How to Run

### Prerequisites

- **Java 17+**
- **Maven 3.8+**

### Build and Run

```bash
mvn clean install
mvn spring-boot:run
```


# Push Docker Image to Amazon ECR

Make sure that you have the latest version of the **AWS CLI** and **Docker** installed.  
For more information, see [Getting Started with Amazon ECR](https://docs.aws.amazon.com/AmazonECR/latest/userguide/getting-started-cli.html).

Use the following steps to authenticate and push an image to your repository.  
For additional registry authentication methods, including the Amazon ECR credential helper, see [Registry Authentication](https://docs.aws.amazon.com/AmazonECR/latest/userguide/registry_auth.html).

---

## 1. Authenticate Docker to Your Registry

Retrieve an authentication token and authenticate your Docker client to your registry using the AWS CLI:

```bash
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 339712902352.dkr.ecr.ap-south-1.amazonaws.com
```

> **Note:** If you receive an error using the AWS CLI, make sure that you have the latest version of the AWS CLI and Docker installed.

---

## 2. Build Your Docker Image

Build your Docker image using the following command.  
For information on building a Dockerfile from scratch, see the instructions [here](https://docs.docker.com/engine/reference/builder/).  
You can skip this step if your image is already built:

```bash
docker build -t app/tour-travels-webapp .
```

---

## 3. Tag Your Docker Image

After the build completes, tag your image so you can push it to this repository:

```bash
docker tag app/tour-travels-webapp:latest 339712902352.dkr.ecr.ap-south-1.amazonaws.com/app/tour-travels-webapp:latest
```

---

## 4. Push the Image to AWS ECR

Run the following command to push this image to your newly created AWS repository:

```bash
docker push 339712902352.dkr.ecr.ap-south-1.amazonaws.com/app/tour-travels-webapp:latest
```

### Access Application
```
Open http://localhost:8080 in your browser.
```
