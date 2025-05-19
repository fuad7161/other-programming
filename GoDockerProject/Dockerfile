# Use the official Go image
FROM golang:1.24.2

#Set working directory
WORKDIR /app

#Copy Go files
COPY . .

#Download dependencies
RUN go mod download

# Build the go app
RUN go build -o app .

#Expose port 8080
EXPOSE 8080

#Run the app
CMD ["./app"]