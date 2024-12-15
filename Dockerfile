FROM archlinux:base-devel AS build

RUN pacman -Sy --noconfirm --needed git base-devel lib32-gcc-libs libpulse libmad libvorbis

RUN useradd -m builder
USER builder
WORKDIR /data

RUN git clone https://aur.archlinux.org/sbagen.git && cd sbagen && makepkg

# ENTRYPOINT ["/usr/lib/sbagen/sbagen"] # 1.1GB

# FROM archlinux:base
# RUN pacman -Sy --noconfirm lib32-glibc lib32-gcc-libs
# COPY --from=build /usr/lib/sbagen/sbagen /
# ENTRYPOINT ["/sbagen"] # 637MB

FROM gcr.io/distroless/static
COPY --from=build /data/sbagen/pkg/sbagen/usr/lib/sbagen/sbagen /sbagen
COPY --from=build /lib/ld-linux.so.2 /lib/ld-linux.so.2
COPY --from=build /usr/lib32 /usr/lib32

# # 148MB !
ENTRYPOINT ["/sbagen"]
