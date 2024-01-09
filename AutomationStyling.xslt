<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Automation Report</title>
                <style>
                    body {  Arial, sans-serif;  0; padding: 0; background-color: #f4f4f4; color: #333; }
                    h1, h2 { color: #333; }
                    table { width: 100%; border-collapse: collapse;  20px; }
                    th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
                    th { background-color: #f0f0f0; }
                    .log-header { background-color: #f0f0f0; padding: 10px;  15px; border-radius: 5px; }
                </style>
            </head>
            <body>
                <h1>System Monitoring Report</h1>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <!-- Template for Log Header -->
    <xsl:template match="logHeader">
        <div class="log-header">
            <h2>Log Information</h2>
            <p><strong>Timestamp:</strong> <xsl:value-of select="timestamp"/></p>
            <p><strong>Log Level:</strong> <xsl:value-of select="logLevel"/></p>
            <p><strong>Categories:</strong> <xsl:value-of select="categories"/></p>
        </div>
    </xsl:template>

    <!-- Template for Logged In Users -->
    <xsl:template match="loggedInUsers">
        <h2>Users Currently Logged In</h2>
        <table>
            <tr><th>User</th><th>Login Time</th></tr>
            <xsl:for-each select="user">
                <tr>
                    <td><xsl:value-of select="name"/></td>
                    <td><xsl:value-of select="time"/></td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>

    <!-- Template for Current Processes -->
    <xsl:template match="currentProcesses">
        <h2>Current Processes</h2>
        <table>
            <tr><th>PID</th><th>Command</th><th>Memory (%)</th></tr>
            <xsl:for-each select="process">
                <tr>
                    <td><xsl:value-of select="pid"/></td>
                    <td><xsl:value-of select="cmd"/></td>
                    <td><xsl:value-of select="mem"/></td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>

    <!-- Template for Top CPU Utilizing Processes -->
    <xsl:template match="topCpuProcesses">
        <h2>Top CPU Utilizing Processes</h2>
        <table>
            <tr><th>PID</th><th>Command</th><th>CPU Usage (%)</th></tr>
            <xsl:for-each select="process">
                <tr>
                    <td><xsl:value-of select="pid"/></td>
                    <td><xsl:value-of select="cmd"/></td>
                    <td><xsl:value-of select="cpu"/></td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>

    <!-- Template for Devices Plugged In -->
    <xsl:template match="pluggedInDevices">
        <h2>Devices Plugged In</h2>
        <table>
            <tr><th>Bus</th><th>Device</th><th>ID</th></tr>
            <xsl:for-each select="device">
                <tr>
                    <td><xsl:value-of select="bus"/></td>
                    <td><xsl:value-of select="device"/></td>
                    <td><xsl:value-of select="id"/></td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>

    <!-- Template for Disk Usage -->
    <xsl:template match="diskUsage">
        <h2>Disk Usage</h2>
        <table>
            <tr><th>Filesystem</th><th>Size</th><th>Used</th><th>Available</th><th>Use%</th><th>Mounted on</th></tr>
            <xsl:for-each select="disk">
                <tr>
                    <td><xsl:value-of select="filesystem"/></td>
                    <td><xsl:value-of select="size"/></td>
                    <td><xsl:value-of select="used"/></td>
                    <td><xsl:value-of select="available"/></td>
                    <td><xsl:value-of select="usePercent"/></td>
                    <td><xsl:value-of select="mounted"/></td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>

    <!-- Template for Network Interfaces and Their States -->
    <xsl:template match="networkInterfaces">
        <h2>Network Interfaces and Their States</h2>
        <table>
            <tr><th>Name</th></tr>
            <xsl:for-each select="interface">
                <tr>
                    <td><xsl:value-of select="name"/></td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>

    <!-- Template for Monitoring Active System Services -->
    <xsl:template match="activeSystemServices">
        <h2>Active System Services</h2>
        <table>
            <tr><th>Service Name</th><th>Description</th></tr>
            <xsl:for-each select="service">
                <tr>
                    <td><xsl:value-of select="name"/></td>
                    <td><xsl:value-of select="description"/></td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>
