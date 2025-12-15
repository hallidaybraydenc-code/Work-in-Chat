# Salesforce Chat Integration Guide

## Overview
Your website includes Salesforce Embedded Service (Chat) integration. The chat widget is already embedded in `index.html`, but you need to configure it with your Salesforce org details.

## Configuration Steps

### 1. Get Your Salesforce Chat Credentials

You'll need to obtain the following from your Salesforce org:

- **Organization ID**: Found in Setup → Company Information
- **Site URL**: Your Salesforce Experience Cloud site URL (if applicable)
- **Deployment ID**: From Embedded Service Deployments setup
- **Button ID**: From your Chat Button configuration
- **Organization URL**: Your Salesforce instance URL (e.g., https://yourorg.my.salesforce.com)

### 2. Update the Chat Configuration

Open `index.html` and replace the placeholders in the Salesforce chat script section (near the bottom of the file):

```javascript
embedded_svc.init(
    'https://vccps--bhscvdev.sandbox.my.salesforce.com', // Replace with your Salesforce org URL
    'https://YOUR_SITE.force.com/liveAgentSetupFlow', // Replace with your site URL
    gslbBaseURL,
    'YOUR_ORG_ID', // Replace with your organization ID (18 characters)
    'YOUR_DEPLOYMENT_NAME', // Replace with deployment name
    {
        baseLiveAgentContentURL: 'https://c.la1-c2-cdg.salesforceliveagent.com/content',
        deploymentId: 'YOUR_DEPLOYMENT_ID', // Replace with deployment ID
        buttonId: 'YOUR_BUTTON_ID', // Replace with button ID
        baseLiveAgentURL: 'https://d.la1-c2-cdg.salesforceliveagent.com/chat',
        eswLiveAgentDevName: 'YOUR_ESW_LIVE_AGENT_DEV_NAME', // Replace with dev name
        isOfflineSupportEnabled: false
    }
);
```

### 3. How to Find These Values in Salesforce

#### Step-by-step:

1. **Log into Salesforce** as an administrator

2. **Go to Setup** (gear icon → Setup)

3. **Navigate to Embedded Service Deployments**:
   - In Quick Find, search for "Embedded Service Deployments"
   - Click on your deployment or create a new one

4. **Get the Embedded Service Code Snippet**:
   - Click on your deployment
   - Click "Get Code" button
   - Copy the generated code snippet
   - Use the values from this snippet to replace the placeholders

5. **Organization ID**:
   - Setup → Company Information
   - Copy the "Organization ID" (18-character value)

### 4. Alternative: Use the Generated Code

Instead of manually replacing values, you can:
1. Get the complete code snippet from Salesforce
2. Replace the entire `<script>` section in `index.html` with the provided code

### 5. Test the Integration

1. Open `index.html` in a web browser
2. You should see a chat button in the bottom-right corner
3. Click the button to test the chat connection
4. Ensure you have agents available in Salesforce to accept chats

## Customization Options

### Change Chat Button Appearance

The chat button colors can be customized in `styles.css`:

```css
.embeddedServiceHelpButton .helpButton .uiButton {
    background-color: #667eea; /* Change this color */
}
```

### Additional Settings

You can modify these settings in the `embedded_svc.settings` object:

- `displayHelpButton`: true/false - Show/hide the chat button
- `language`: Set language code (e.g., 'en', 'es', 'fr')
- `isOfflineSupportEnabled`: Enable offline support/case creation

## Troubleshooting

### Chat button doesn't appear:
- Verify all credentials are correct
- Check browser console for errors
- Ensure your Salesforce deployment is active

### Chat button appears but doesn't connect:
- Verify agents are online in Salesforce
- Check deployment and button IDs
- Verify your IP isn't restricted in Salesforce

### CORS errors:
- Add your domain to Salesforce CORS whitelist
- Setup → CORS → New → Add your domain

## Resources

- [Salesforce Embedded Service Documentation](https://developer.salesforce.com/docs/atlas.en-us.service_sdk_ios.meta/service_sdk_ios/embedded_service.htm)
- [Embedded Chat Setup Guide](https://help.salesforce.com/s/articleView?id=sf.snapins_chat_setup.htm)

## Support

For additional help:
- Contact your Salesforce administrator
- Visit Salesforce Trailhead for tutorials
- Check Salesforce Help & Training
