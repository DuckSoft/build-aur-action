# pkgbuild-aur action

## Example usage
```yaml
uses: zjuyk/pkgbuild-aur@master
with:
  pkg-name: wps-office
```

## Tips
### use matrix to build multi pkgs

```yml
strategy:
  matrix:
    pkgs: [ wps-office, ttf-wps-fonts ]

steps:
  - uses: zjuyk/pkgbuild-aur@master
    with:
      pkg-name: ${{ matrix.pkgs }}
```
