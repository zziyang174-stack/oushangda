Add-Type -AssemblyName System.Drawing
$src = 'C:\Users\administered\Desktop\oushangda-website\_shots\index_mobile.png'
$img = [System.Drawing.Image]::FromFile($src)
$w = $img.Width
$h = $img.Height
Write-Output "size $w x $h"
$n = 6
$sh = [int][Math]::Floor($h / $n)
for ($i = 0; $i -lt $n; $i++) {
    $top = $i * $sh
    $bh = if ($i -lt $n - 1) { $sh } else { $h - $top }
    $bmp = New-Object System.Drawing.Bitmap($w, $bh)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $dst = New-Object System.Drawing.Rectangle(0, 0, $w, $bh)
    $srcRect = New-Object System.Drawing.Rectangle(0, $top, $w, $bh)
    $g.DrawImage($img, $dst, $srcRect, [System.Drawing.GraphicsUnit]::Pixel)
    $out = "C:\Users\administered\Desktop\oushangda-website\_shots\mobile_$($i+1).png"
    $bmp.Save($out, [System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose()
    $bmp.Dispose()
    Write-Output "saved $out"
}
$img.Dispose()
