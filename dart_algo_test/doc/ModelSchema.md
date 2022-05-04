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
  "STATION_ID": string,
  "ADJACENCY_ID": string
}
```

## Cost

```
{
  "STATION_ID_SRC": string,
  "STATION_ID_DEST": string,
  "PRICE": int,
  "DURATION": int
}
```
