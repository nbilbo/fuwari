# Official Node.js
FROM node:23.3.0-slim

# Set the working directory in the container
WORKDIR /app

# Copy package.json and pnpm-lock.yaml
COPY pnpm-lock.yaml package.json ./

# Install PNPM
RUN npm install -g pnpm

# Install dependencies
RUN pnpm i 

# Copy the application code 
COPY . .

# Build the TypeScript code
# RUN pnpm run build

# Expose the app
EXPOSE 4321

# Start the application
CMD ["pnpm", "dev", "--port", "4321", "--host", "0.0.0.0"]
