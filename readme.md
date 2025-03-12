# Flighty To HTML

This scrip will convert a Flighty csv flight log, into a nice HTML table.

## Usage

1. Export your Flighty flight log, and save it to your computer.

2. Run `./flights.sh <PATH TO FLIGHT LOG>`

3. Use the HTML table however you want.

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
