# Support Hub Website

A modern, responsive support portal with multiple chat platform integrations.

## Features

🏠 **Support Hub** - Central landing page with platform selection
💬 **Multi-Platform Chat** - Integrated Salesforce and ServiceNow chat
📱 **Responsive Design** - Works perfectly on all devices
🎨 **Modern UI** - Gradient colors and smooth animations
🔗 **Easy Navigation** - Quick access to different support channels

## Quick Start

1. **View the Website**
   - Open `index.html` in any web browser
   - Click on either Salesforce or ServiceNow chat options

2. **Configure Salesforce Chat** (Optional)
   - Follow the detailed instructions in `SALESFORCE_SETUP.md`
   - Get your credentials from Salesforce Setup
   - Update the chat configuration in `salesforce.html`

3. **Configure ServiceNow Chat** (Optional)
   - Follow the detailed instructions in `SERVICENOW_SETUP.md`
   - Get your credentials from ServiceNow Setup
   - Update the chat configuration in `servicenow.html`

4. **Customize Content**
   - Edit text in `index.html`, `salesforce.html`, and `servicenow.html`
   - Update contact information
   - Modify colors in `styles.css`

## File Structure

```
Website Folder/
├── index.html              # Main landing page with support options
├── salesforce.html         # Salesforce chat page
├── servicenow.html         # ServiceNow chat page
├── styles.css              # All styling
├── images/                 # Image folder (optional)
│   └── README.md           # Image guidelines
├── SALESFORCE_SETUP.md     # Salesforce chat setup guide
├── SERVICENOW_SETUP.md     # ServiceNow chat setup guide
└── README.md               # This file
```

## How It Works

1. **Main Page** (`index.html`) - Users land here and see two support options
2. **Platform Selection** - Users click on either Salesforce or ServiceNow card
3. **Chat Page** - Users are directed to the respective platform page where the chat widget loads

## Customization

### Colors
The website uses a purple gradient theme. To change colors, edit `styles.css`:
- Main theme: `#667eea` and `#764ba2`
- ServiceNow theme: `#62a87c` and `#3d7ea6`

### Support Cards
Edit the support card text in `index.html`:
- `.support-card` section contains the descriptions for each platform

### Navigation
Add or remove menu items in the `<nav>` section of each HTML file

## Browser Compatibility

✅ Chrome (latest)
✅ Firefox (latest)
✅ Safari (latest)
✅ Edge (latest)
✅ Mobile browsers

## Tips

- **Testing Chat**: Test each chat platform separately in incognito mode
- **Deployment**: Can be hosted on GitHub Pages, Netlify, Vercel, or any web host
- **CORS**: Ensure your hosting domain is whitelisted in both Salesforce and ServiceNow
- **Multiple Platforms**: You can add more chat platforms by creating additional HTML pages

## Need Help?

- For Salesforce chat issues, see `SALESFORCE_SETUP.md`
- For ServiceNow chat issues, see `SERVICENOW_SETUP.md`
- All code is well-commented for easy customization

## Adding More Chat Platforms

To add additional chat platforms (e.g., Zendesk, Intercom):

1. Create a new HTML file (e.g., `zendesk.html`)
2. Copy structure from `salesforce.html` or `servicenow.html`
3. Add the platform's chat widget code
4. Add a new support card in `index.html`
5. Update navigation and styling as needed

## Next Steps

1. ✅ Multi-platform support structure created
2. ⏳ Configure Salesforce chat credentials
3. ⏳ Configure ServiceNow chat credentials
4. ⏳ Test both chat integrations
5. ⏳ Customize content and branding
6. ⏳ Deploy to a web host

Enjoy your new support hub! 🚀
