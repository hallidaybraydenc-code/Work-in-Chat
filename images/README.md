# Images Folder

This folder contains images for your website.

## Required Images

To make your website fully functional, add the following images to this folder:

### Profile Image
- **Filename**: `profile.jpg`
- **Purpose**: Your main bio/profile photo
- **Recommended size**: 800x800px (square format works best)
- **Format**: JPG, PNG, or WebP

### Gallery Images
- **Filenames**: `gallery-1.jpg` through `gallery-6.jpg`
- **Purpose**: Images for the gallery section
- **Recommended size**: 1200x800px (landscape) or 800x800px (square)
- **Format**: JPG, PNG, or WebP

## Tips for Best Results

1. **Optimize your images** - Use tools like TinyPNG or ImageOptim to reduce file sizes
2. **Use consistent aspect ratios** - Especially for gallery images
3. **High quality** - Use at least 1200px width for gallery images
4. **File naming** - Stick to the filenames referenced in index.html or update the HTML accordingly

## Placeholder Images

While developing, you can use free placeholder services:
- https://picsum.photos (e.g., https://picsum.photos/800/800 for profile)
- https://unsplash.com (free high-quality photos)
- https://pexels.com (free stock photos)

## Adding Your Own Images

1. Place your images in this folder
2. Name them according to the list above, or
3. Update the `src` attributes in `index.html` to match your filenames

Example:
```html
<img src="images/my-photo.jpg" alt="Profile Photo">
```
