<script>
    // Show the cookie and cache permission prompt when the page loads
    window.onload = function () {
        const permissionPrompt = document.getElementById('permission-prompt');
        if (!localStorage.getItem('cookiesAccepted')) {
            permissionPrompt.style.display = 'block';
        }
    };

    // Function to handle acceptance of cookies and caching
    function acceptCookiesAndCache() {
        alert("Cookies and caching enabled. Thank you for your consent!");
        document.getElementById('permission-prompt').style.display = 'none';
        localStorage.setItem('cookiesAccepted', 'true');
    }

    // Function to handle rejection of cookies and caching
    function declineCookiesAndCache() {
        alert("Cookies and caching disabled. Some features may not work as expected.");
        document.getElementById('permission-prompt').style.display = 'none';
        localStorage.setItem('cookiesAccepted', 'false');
    }

    // Function to show/hide the IP form
    function showIpForm() {
        const ipForm = document.getElementById('ip-form');
        const wifiList = document.getElementById('wifi-list');
        const deviceList = document.getElementById('device-list');
        const ddosMenu = document.getElementById('ddos-menu');
        const output = document.getElementById('output');

        // Toggle the IP form
        if (ipForm.style.display === 'none' || ipForm.style.display === '') {
            ipForm.style.display = 'flex';
            wifiList.style.display = 'none';
            deviceList.style.display = 'none';
            ddosMenu.style.display = 'none';
            output.style.display = 'none'; // Hide IP output if visible
        } else {
            ipForm.style.display = 'none';
        }
    }

    // Function to find the website IP
    function findWebsiteIp() {
        const websiteUrl = document.getElementById('website-url').value;
        if (websiteUrl) {
            // Simulate fetching IP details (replace with actual API call)
            const output = document.getElementById('output');
            output.style.display = 'block';
            document.getElementById('ip-address').textContent = '192.168.1.1';
            document.getElementById('host-name').textContent = websiteUrl;
            document.getElementById('location').textContent = 'Simulated Location';
            document.getElementById('organization').textContent = 'Simulated Organization';
            document.getElementById('country').textContent = 'Simulated Country';
            document.getElementById('region').textContent = 'Simulated Region';
            document.getElementById('city').textContent = 'Simulated City';

            // Hide other outputs
            document.getElementById('wifi-list').style.display = 'none';
            document.getElementById('device-list').style.display = 'none';
        } else {
            alert('Please enter a valid website URL.');
        }
    }

    // Function to show/hide the DDOS menu
    function showDdosMenu() {
        const ddosMenu = document.getElementById('ddos-menu');
        const ipForm = document.getElementById('ip-form');
        const wifiList = document.getElementById('wifi-list');
        const deviceList = document.getElementById('device-list');
        const output = document.getElementById('output');

        // Toggle the DDOS menu
        if (ddosMenu.style.display === 'none' || ddosMenu.style.display === '') {
            ddosMenu.style.display = 'flex';
            ipForm.style.display = 'none';
            wifiList.style.display = 'none';
            deviceList.style.display = 'none';
            output.style.display = 'none'; // Hide IP output if visible
        } else {
            ddosMenu.style.display = 'none';
        }
    }

    // Function to simulate a DDOS attack
    function simulateDdos() {
        const ip = document.getElementById('ddos-ip').value;
        const packets = document.getElementById('ddos-packets').value;
        if (ip && packets) {
            alert(`Simulating DDOS attack on ${ip} with ${packets} packets.`);
        } else {
            alert('Please enter a valid IP address and number of packets.');
        }
    }

    // Function to find users on the network
    function findUsersOnNetwork() {
        const wifiList = document.getElementById('wifi-list');
        const ipForm = document.getElementById('ip-form');
        const deviceList = document.getElementById('device-list');
        const ddosMenu = document.getElementById('ddos-menu');
        const output = document.getElementById('output');

        // Toggle the Wi-Fi list
        if (wifiList.style.display === 'none' || wifiList.style.display === '') {
            wifiList.style.display = 'block';
            ipForm.style.display = 'none';
            deviceList.style.display = 'none';
            ddosMenu.style.display = 'none';
            output.style.display = 'none'; // Hide IP output if visible

            // Simulate finding users on the network
            const wifiNetworks = document.getElementById('wifi-networks');
            wifiNetworks.innerHTML = '<li>Wi-Fi Network 1</li><li>Wi-Fi Network 2</li><li>Wi-Fi Network 3</li>';
        } else {
            wifiList.style.display = 'none';
        }
    }
</script>