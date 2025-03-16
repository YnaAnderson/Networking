const express = require('express');
const cors = require('cors');
const app = express();
const port = 3000;

// Enable CORS for all routes
app.use(cors());

// Mock data for nearby Wi-Fi networks
const mockNetworks = [
    { id: 1, name: "Home Wi-Fi", location: "Nearby" },
    { id: 2, name: "Office Wi-Fi", location: "Nearby" },
    { id: 3, name: "Public Wi-Fi", location: "Nearby" },
];

// Mock data for connected devices
const mockDevices = [
    { networkId: 1, name: "Device 1", ip: "192.168.1.101", type: "Laptop" },
    { networkId: 1, name: "Device 2", ip: "192.168.1.102", type: "Smartphone" },
    { networkId: 2, name: "Device 3", ip: "192.168.1.103", type: "Smart TV" },
];

// API to fetch nearby Wi-Fi networks
app.get('/api/nearby-wifi', (req, res) => {
    const { lat, lon } = req.query;
    // Simulate fetching networks based on location
    res.json({ networks: mockNetworks });
});

// API to scan a network for connected devices
app.get('/api/scan-network', (req, res) => {
    const { id } = req.query;
    // Simulate fetching devices for the selected network
    const devices = mockDevices.filter(device => device.networkId == id);
    res.json({ devices });
});

// Start the server
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});