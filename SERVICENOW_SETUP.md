# ServiceNow Chat Integration Guide

## Overview
The ServiceNow chat page (`servicenow.html`) is configured to support ServiceNow Virtual Agent or Connect Chat. You need to configure it with your ServiceNow instance details.

## Integration Options

ServiceNow offers two main chat integration options:

### Option 1: Virtual Agent (Recommended)
ServiceNow Virtual Agent provides AI-powered conversational support with Natural Language Understanding (NLU).

### Option 2: Connect Chat
Traditional live chat with human agents and optional bot assistance.

## Configuration Steps

### For Virtual Agent:

1. **Get Your ServiceNow Instance URL**
   - Format: `https://YOUR_INSTANCE.service-now.com`
   - Example: `https://dev12345.service-now.com`

2. **Create or Get Topic ID**
   - Log into ServiceNow as admin
   - Navigate to: **Virtual Agent → Designer**
   - Select or create a topic
   - Copy the Topic ID (sys_id)

3. **Update servicenow.html**
   Replace these values in the script section:
   ```javascript
   instanceUrl: 'https://YOUR_INSTANCE.service-now.com',
   sysparmTopicId: 'YOUR_TOPIC_ID',
   topicName: 'YOUR_TOPIC_NAME'
   ```

### For Connect Chat:

If using Connect Chat instead of Virtual Agent:

1. **Enable Connect Chat**
   - Navigate to: **Connect Support → Administration → Settings**
   - Enable "Connect Chat"
   - Configure chat settings

2. **Get API Credentials**
   - Navigate to: **System Web Services → REST API Explorer**
   - Generate or copy your API credentials

3. **Update servicenow.html**
   - Uncomment the Connect Chat section (lines with `/* */`)
   - Comment out the Virtual Agent section
   - Add your instance URL and session token

## Detailed Setup Instructions

### Step 1: Access ServiceNow Setup

1. Log into your ServiceNow instance as an administrator
2. Navigate to the ServiceNow Setup page (gear icon)

### Step 2: Configure Virtual Agent

1. **Navigate to Virtual Agent Designer**:
   - Use the Application Navigator
   - Search for "Virtual Agent"
   - Click "Virtual Agent Designer"

2. **Create or Select a Topic**:
   - Click "Create New Topic" or select an existing one
   - Configure conversation flows
   - Publish the topic

3. **Get the Topic ID**:
   - Right-click on the topic
   - Select "Copy sys_id"
   - This is your `sysparmTopicId`

### Step 3: Enable Widget

1. **Navigate to Virtual Agent Settings**:
   - Go to: **Virtual Agent → Administration → Settings**
   - Enable "VA Messaging"
   - Enable "Web Widget"

2. **Configure Widget Settings**:
   - Set widget position (bottom-right recommended)
   - Choose color scheme
   - Set greeting message
   - Configure branding

### Step 4: Get Embed Code (Alternative Method)

Instead of manual configuration:

1. Navigate to: **Virtual Agent → Web Widget → Configuration**
2. Click "Generate Embed Code"
3. Copy the entire script block
4. Replace the script section in `servicenow.html` with the generated code

## Testing the Integration

1. Open `servicenow.html` in a web browser
2. The chat widget should appear in the bottom-right corner
3. Click the widget to test the conversation
4. Verify Virtual Agent responds correctly

## Customization Options

### Change Widget Colors

In `servicenow.html`, modify the `primaryColor` value:
```javascript
primaryColor: '#62a87c' // Change to your brand color
```

### Change Widget Position

Options: `bottom-right`, `bottom-left`, `top-right`, `top-left`
```javascript
position: 'bottom-right'
```

### Auto-Open Widget

To automatically open the chat on page load:
```javascript
autoOpen: true
```

## Common Issues & Troubleshooting

### Widget Doesn't Appear
- Verify instance URL is correct
- Check that Virtual Agent is enabled
- Ensure topic is published and active
- Check browser console for errors

### Authentication Errors
- Verify your session token is valid
- Check CORS settings in ServiceNow
- Add your domain to allowed origins:
  - Navigate to: **System Web Services → REST → CORS Rules**
  - Create new rule for your domain

### Widget Appears But Doesn't Respond
- Verify topic ID is correct
- Ensure Virtual Agent service is running
- Check that NLU model is trained
- Review Virtual Agent logs for errors

## Required ServiceNow Plugins

Ensure these plugins are activated:
- **Glide Virtual Agent** (com.glide.cs.chatbot)
- **Virtual Agent Messaging** (com.glide.cs.chatbot.messaging)
- **Virtual Agent Web Widget** (com.glide.cs.chatbot.web_widget)

To check plugins:
1. Navigate to: **System Applications → All Available Applications → All**
2. Search for "Virtual Agent"
3. Install required plugins if not active

## Security Considerations

1. **CORS Configuration**: Add your website domain to CORS rules
2. **Authentication**: Configure appropriate authentication methods
3. **Rate Limiting**: Set rate limits for chat API calls
4. **Data Privacy**: Ensure compliance with data protection regulations

## Advanced Configuration

### Custom Branding
```javascript
config: {
    primaryColor: '#62a87c',
    secondaryColor: '#3d7ea6',
    headerText: 'IT Support',
    headerSubtext: 'How can we help?',
    logoUrl: 'https://yoursite.com/logo.png'
}
```

### Pre-filled Information
Pass user context to Virtual Agent:
```javascript
userData: {
    name: 'User Name',
    email: 'user@example.com',
    department: 'IT'
}
```

## Resources

- [ServiceNow Virtual Agent Documentation](https://docs.servicenow.com/bundle/utah-customer-service-management/page/product/virtual-agent/concept/virtual-agent.html)
- [Connect Chat Setup Guide](https://docs.servicenow.com/bundle/utah-servicenow-platform/page/product/connect-chat/concept/connect-chat-setup.html)
- [ServiceNow Developer Portal](https://developer.servicenow.com/)

## Support

For additional help:
- Contact your ServiceNow administrator
- Visit ServiceNow Community forums
- Check ServiceNow Support portal
- Review ServiceNow product documentation
