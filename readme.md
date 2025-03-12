# Flighty To HTML

This scrip will convert a Flighty csv flight log, into a nice HTML table.

<table border='1'>
<tr><th>Date</th><th>Airline</th><th>Flight</th><th>Route</th><th>Aircraft Type Name</th><th>Tail Number</th></tr>
<tr><td>2023-08-24</td><td>Southwest <img src=/assets/ali/swa.png width=16/></td><td>501</td><td>IND ✈ BWI</td><td>Boeing 737 MAX 8</td><td>N8872Q</td></tr>
<tr><td>2023-08-24</td><td>Southwest <img src=/assets/ali/swa.png width=16/></td><td>1307</td><td>DEN ✈ IND</td><td>Boeing 737-700</td><td>N259WN</td></tr>
<tr><td>2023-08-21</td><td>Southwest <img src=/assets/ali/swa.png width=16/></td><td>2820</td><td>RDU ✈ DEN</td><td>Boeing 737-800</td><td>N8612K</td></tr>
<tr><td>2023-08-21</td><td>Southwest <img src=/assets/ali/swa.png width=16/></td><td>2820</td><td>BWI ✈ RDU</td><td>Boeing 737-800</td><td>N8612K</td></tr>
<tr><td>2022-09-24</td><td>Spirit <img src=/assets/ali/nks.png width=16/></td><td>1435</td><td>ATL ✈ BWI</td><td>Airbus A321</td><td>N671NK</td></tr>
<tr><td>2022-09-24</td><td>Spirit <img src=/assets/ali/nks.png width=16/></td><td>1305</td><td>BWI ✈ ATL</td><td>Airbus A321</td><td>N660NK</td></tr>
</table>

## Usage

1. Export your Flighty flight log, and save it to your computer.

2. Run `./flights.sh <PATH TO FLIGHT LOG>`

3. Use the HTML table however you want.

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
