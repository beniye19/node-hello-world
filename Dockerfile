# Use an updated and lightweight Node.js version
FROM node:18-slim

# Set working directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm ci --only=production

# Copy application source code
COPY . .

# Use a non-root user for security (optional)
RUN useradd --create-home appuser
USER appuser

# Expose the application port
EXPOSE 3000

# Start the app
CMD ["node", "app.js"]
