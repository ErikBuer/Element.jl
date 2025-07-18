# Layout

## Column

`Column` is a component for creating linear layout.

``` @example ColumnExample
using Fugl

function MyApp()
    Column([
        Container(),
        Container(),
        Container(),
    ])
end

screenshot(MyApp, "column.png", 400, 300);
nothing #hide
```

![Column example](column.png)

## Row

`Row` is a component for creating linear layout.

``` @example RowExample
using Fugl

function MyApp()
    Row([
        Container(),
        Container(),
        Container(),
    ])
end

screenshot(MyApp, "row.png", 400, 300);
nothing #hide
```

![Row example](row.png)

## Sizing

``` @example IntrinsicSizeExample
using Fugl
using Fugl: Text

function MyApp()
    Column([
        IntrinsicWidth(Container(Text("IntrinsicWidth"))),
        IntrinsicSize(Container(Text("IntrinsicSize"))),
        IntrinsicHeight(Container(Text("IntrinsicHeight"))),
    ])
end

screenshot(MyApp, "intrinsic_sizing.png", 400, 300);
nothing #hide
```

![Intrinsic sizing example](intrinsic_sizing.png)

``` @example FixedSizeExample
using Fugl
using Fugl: Text

function MyApp()
    Column([
        FixedSize(Container(), 400, 50),
        FixedSize(Container(), 400, 50),
        FixedSize(Container(), 400, 50),
    ])
end

screenshot(MyApp, "fixed_sizing.png", 400, 300);
nothing #hide
```

![Fixed sizing example](fixed_sizing.png)

## IntrinsicColumn

``` @example IntrinsicColumnExample
using Fugl
using Fugl: Text

function MyApp()
    IntrinsicColumn([
        FixedSize(Container(Text("Clipping width")), 800, 50),
        FixedSize(Container(), 400, 50),
        FixedSize(Container(), 200, 50),
    ])
end

screenshot(MyApp, "intrinsic_column.png", 400, 300);
nothing #hide
```

![Intrinsic Column](intrinsic_column.png)

## IntrinsicRow

``` @example IntrinsicColumnExample
using Fugl
using Fugl: Text

function MyApp()
    IntrinsicRow([
        FixedSize(Container(Text("Clipping Height")), 50, 800),
        FixedSize(Container(), 50, 400),
        FixedSize(Container(), 50, 200),
    ])
end

screenshot(MyApp, "intrinsic_row.png", 400, 300);
nothing #hide
```

![Intrinsic row](intrinsic_row.png)

## Alignment

The alignment components allow you to position sized components within their containers.

### Horizontal Alignment

``` @example AlignHorizontalExample
using Fugl
using Fugl: Text

function MyApp()
    Column([
        AlignHorizontal(FixedSize(Container(Text("Left")), 100, 50), :left),
        AlignHorizontal(FixedSize(Container(Text("Center")), 100, 50), :center),
        AlignHorizontal(FixedSize(Container(Text("Right")), 100, 50), :right),
    ])
end

screenshot(MyApp, "horizontal_alignment.png", 400, 300);
nothing #hide
```

![Horizontal alignment example](horizontal_alignment.png)

### Vertical Alignment

``` @example AlignVerticalExample
using Fugl
using Fugl: Text

function MyApp()
    Row([
        AlignVertical(IntrinsicSize(Container(Text("Top"))), :top),
        AlignVertical(IntrinsicSize(Container(Text("Center"))), :center),
        AlignVertical(IntrinsicSize(Container(Text("Bottom"))), :bottom),
    ])
end

screenshot(MyApp, "vertical_alignment.png", 400, 300);
nothing #hide
```

![Vertical alignment example](vertical_alignment.png)
