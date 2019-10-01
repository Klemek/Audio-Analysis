[![Scc Count Badge](https://sloc.xyz/github/klemek/audio-analysis/?category=code)](https://github.com/boyter/scc/#badges-beta)
[![Maven Central](https://img.shields.io/maven-central/v/com.github.klemek/audio-analysis.svg)](https://search.maven.org/search?q=g:%22com.github.klemek%22%20AND%20a:%22audio-analysis%22)
![License](https://img.shields.io/github/license/Klemek/Audio-Analysis.svg)

# Audio-Analysis
A simple FFT library in Java.
Compute FFT from any WAV or MP3 file and perform calculation on it.

**Disclaimer : I'm not the author of this repo**

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


## Origin of this library
I stumbled on [this stackoverflow question](https://stackoverflow.com/questions/17565269/calculate-fft-from-audio-file) from 2014 while searching how to compute a simple FFT in Java. The first answer was linking to a dead repository on code.google.com but someone had the brillant idea to [clone it to Github](https://github.com/Uriopass/audio-analysis) before it was too late.

I just did some cleanup and uploaded it to [Maven Central](https://search.maven.org/search?q=g:%22com.github.klemek%22%20AND%20a:%22audio-analysis%22) for a everyone.
