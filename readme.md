# Flighty To HTML

This script will convert a Flighty csv flight log, into a nice HTML table. Airport codes will also link to FlightRadar24 for info on that airport.

<table border='1'>
<tr><th>Date</th><th>Airline</th><th>Flight</th><th>Route</th><th>Aircraft Type Name</th><th>Tail Number</th></tr>
<tr><td>2025-05-13</td><td>Delta <img src=/assets/ali/dal.png width=16/></td><td>2780</td><td><a href="https://www.flightradar24.com/data/airports/dal" target="_blank" rel="noreferrer">DAL</a> ✈ <a href="https://www.flightradar24.com/data/airports/atl" target="_blank" rel="noreferrer">ATL</a></td><td>Boeing 717-200</td><td>N955AT</td></tr>
<tr><td>2025-05-10</td><td>Delta <img src=/assets/ali/dal.png width=16/></td><td>2711</td><td><a href="https://www.flightradar24.com/data/airports/bwi" target="_blank" rel="noreferrer">BWI</a> ✈ <a href="https://www.flightradar24.com/data/airports/atl" target="_blank" rel="noreferrer">ATL</a></td><td>Boeing 757-200</td><td>N6704Z</td></tr>
<tr><td>2025-03-25</td><td>Southwest <img src=/assets/ali/swa.png width=16/></td><td>3548</td><td><a href="https://www.flightradar24.com/data/airports/iad" target="_blank" rel="noreferrer">IAD</a> ✈ <a href="https://www.flightradar24.com/data/airports/den" target="_blank" rel="noreferrer">DEN</a></td><td>Boeing 737-700</td><td>N213WN</td></tr>
<tr><td>2025-01-12</td><td>Southwest <img src=/assets/ali/swa.png width=16/></td><td>1893</td><td><a href="https://www.flightradar24.com/data/airports/den" target="_blank" rel="noreferrer">DEN</a> ✈ <a href="https://www.flightradar24.com/data/airports/bwi" target="_blank" rel="noreferrer">BWI</a></td><td>Boeing 737-700</td><td>N954WN</td></tr>
<tr><td>2022-09-24</td><td>Spirit <img src=/assets/ali/nks.png width=16/></td><td>1435</td><td><a href="https://www.flightradar24.com/data/airports/atl" target="_blank" rel="noreferrer">ATL</a> ✈ <a href="https://www.flightradar24.com/data/airports/bwi" target="_blank" rel="noreferrer">BWI</a></td><td>Airbus A321</td><td>N671NK</td></tr>
</table>

It will also output a simple stats tables

<table border='1'>
<tr><th>Flights</th><th>Airports</th><th>Airlines</th><th>Aircraft</th></tr>
<tr><td>26</td><td>12</td><td>2</td><td>4</td></tr>
</table>

## Usage

1. Export your Flighty flight log, and save it to your computer.

2. Run `./flights.sh <PATH TO FLIGHT LOG>`

3. Use the HTML tables however you want.

## Exporting Flighty Log

1. Click on your profile picture.

2. Click Setting.

3. Scroll down and click Account Data.

4. Click Export Your Flights.

5. Enter your email.

6. Save the log from the email from Flighty.

## Adding Airlines

To add extra airline names, add both the ICAO code (its in the flights log), and the Airline name to the awk section of the script. For example, to add Air Koryo, do the following.

1. Look for the folowing section in the script.

```BASH
airline["SWA"] = "Southwest";
airline["DAL"] = "Delta";
airline["NKS"] = "Spirit";
```

2. Add the wanted airline.

```BASH
airline["SWA"] = "Southwest";
airline["DAL"] = "Delta";
airline["NKS"] = "Spirit";
airline["KOR"] = "Air Koryo";
```

3. (optinal) Question why you flew on [Air Koryo](https://en.wikipedia.org/wiki/Air_Koryo).

## Fun Extra

You can add little airline logos to the airline names if you want. Here is an example.

```BASH
airline["SWA"] = "Southwest <img src='/assets/ali/swa.png' width='16'/>";
airline["DAL"] = "Delta <img src='/assets/ali/dal.png' width='16'/>";
airline["NKS"] = "Spirit <img src='/assets/ali/nks.png' width='16'/>";
```
