[![Maven Central](https://img.shields.io/maven-central/v/com.github.klemek/audio-analysis.svg)](https://search.maven.org/search?q=g:%22com.github.klemek%22%20AND%20a:%22audio-analysis%22)
![License](https://img.shields.io/github/license/Klemek/Audio-Analysis.svg)

# Audio-Analysis
Automatically exported from code.google.com/p/audio-analysis

## Disclaimer
I'm not the author of this repo, only cloned it before it was too late, as code.google.com deleted all the little projects.

## Use

```java

// Compute FFT from WAV/MP3 file
WaveDecoder decoder = new WaveDecoder(new FileInputStream(wavFile));
FFT fft = new FFT(1024, wavFileObj.getSampleRate());

//Do calculation from FFT
float[] samples = new float[1024];
float[] spectrum = new float[1024 / 2 + 1];
float[] lastSpectrum = new float[1024 / 2 + 1];
List<Float> spectralFlux = new ArrayList<Float>();

while (decoder.readSamples(samples) > 0) {
    fft.forward(samples);
    System.arraycopy(spectrum, 0, lastSpectrum, 0, spectrum.length);
    System.arraycopy(fft.getSpectrum(), 0, spectrum, 0, spectrum.length);

    float flux = 0;
    for (int i = 0; i < spectrum.length; i++)
        flux += (spectrum[i] - lastSpectrum[i]);
    spectralFlux.add(flux);
}
```