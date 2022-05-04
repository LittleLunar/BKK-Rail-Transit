# Model Schema

## Station

```
{
  "ID": string,
  "NAME": string,
  "LINE_NUMBER": int,
  "DETAIL": string,
  "LAT": int,
  "LONG": int
}
```

## Attraction 

```
{
  "STATION_ID": string,
  "NAME": string,
  "DETAIL": string,
  "LAT": int,
  "LONG": int
}
```

## Gate

```
{
  "STATION_ID": string,
  "GATE_NUM": string,
  "DETAIL": string
}
```

## Ajacency

```
{
  "STATION_ID_1": string,
  "STATION_ID_2": string
}
```

## Cost

```
{
  "STATION_ID_SRC": string,
  "STATION_ID_DEST": string,
  "STATION_LINENUMBER": string,
  "PRICE": int,
  "DURATION": int
}
```