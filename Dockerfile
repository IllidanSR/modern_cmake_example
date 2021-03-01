FROM fedora:32

RUN uname -r

RUN dnf update -y && dnf install -y \
  autoconf \
  automake \
  cmake \
  curl \
  gcc \
  g++ \
  git \
  libtool \
  make \
  pkg-config \
  unzip \
  wget \
  python3 \
  golang \

RUN dnf install -y protobuf-devel.x86_64

RUN  git clone -b v2.13.3 https://github.com/catchorg/Catch2.git && cd Catch2 && \
                                                        cmake -Bbuild -H. -DBUILD_TESTING=OFF && \
                                                        cmake --build build/ --target install

COPY . /opt/modern_cmake_project
RUN mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Release .. && make -j4
ENTRYPOINT ["./ICOL.example.application.main"]