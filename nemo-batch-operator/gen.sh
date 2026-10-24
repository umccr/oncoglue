#!/usr/bin/env bash
set -euo pipefail


date
echo ----------------
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091002d1f664 -o ./data/output/tidywigits/0.0.7.9003/5025091002d1f664 --ulid --prefix_include --input_id 5025091002d1f664
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509100539df0e -o ./data/output/tidywigits/0.0.7.9003/502509100539df0e --ulid --prefix_include --input_id 502509100539df0e
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091008f46baf -o ./data/output/tidywigits/0.0.7.9003/5025091008f46baf --ulid --prefix_include --input_id 5025091008f46baf
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509100f5f7051 -o ./data/output/tidywigits/0.0.7.9003/502509100f5f7051 --ulid --prefix_include --input_id 502509100f5f7051
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250910117c3950 -o ./data/output/tidywigits/0.0.7.9003/50250910117c3950 --ulid --prefix_include --input_id 50250910117c3950
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509102597e9d6 -o ./data/output/tidywigits/0.0.7.9003/502509102597e9d6 --ulid --prefix_include --input_id 502509102597e9d6
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091027c704fe -o ./data/output/tidywigits/0.0.7.9003/5025091027c704fe --ulid --prefix_include --input_id 5025091027c704fe
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091030faf837 -o ./data/output/tidywigits/0.0.7.9003/5025091030faf837 --ulid --prefix_include --input_id 5025091030faf837
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509103360ecd6 -o ./data/output/tidywigits/0.0.7.9003/502509103360ecd6 --ulid --prefix_include --input_id 502509103360ecd6
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091037446890 -o ./data/output/tidywigits/0.0.7.9003/5025091037446890 --ulid --prefix_include --input_id 5025091037446890
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509103a0917ef -o ./data/output/tidywigits/0.0.7.9003/502509103a0917ef --ulid --prefix_include --input_id 502509103a0917ef
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509103b4944d6 -o ./data/output/tidywigits/0.0.7.9003/502509103b4944d6 --ulid --prefix_include --input_id 502509103b4944d6
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509103c7b1a3b -o ./data/output/tidywigits/0.0.7.9003/502509103c7b1a3b --ulid --prefix_include --input_id 502509103c7b1a3b
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509103e514a1c -o ./data/output/tidywigits/0.0.7.9003/502509103e514a1c --ulid --prefix_include --input_id 502509103e514a1c
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250910410b2e4a -o ./data/output/tidywigits/0.0.7.9003/50250910410b2e4a --ulid --prefix_include --input_id 50250910410b2e4a
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509104d210311 -o ./data/output/tidywigits/0.0.7.9003/502509104d210311 --ulid --prefix_include --input_id 502509104d210311
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091052e970c2 -o ./data/output/tidywigits/0.0.7.9003/5025091052e970c2 --ulid --prefix_include --input_id 5025091052e970c2
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509106675981b -o ./data/output/tidywigits/0.0.7.9003/502509106675981b --ulid --prefix_include --input_id 502509106675981b
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509106cfb2d3c -o ./data/output/tidywigits/0.0.7.9003/502509106cfb2d3c --ulid --prefix_include --input_id 502509106cfb2d3c
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509106e0184ab -o ./data/output/tidywigits/0.0.7.9003/502509106e0184ab --ulid --prefix_include --input_id 502509106e0184ab
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091070c6deeb -o ./data/output/tidywigits/0.0.7.9003/5025091070c6deeb --ulid --prefix_include --input_id 5025091070c6deeb
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509107df2eacc -o ./data/output/tidywigits/0.0.7.9003/502509107df2eacc --ulid --prefix_include --input_id 502509107df2eacc
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091084ea66a2 -o ./data/output/tidywigits/0.0.7.9003/5025091084ea66a2 --ulid --prefix_include --input_id 5025091084ea66a2
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091088c1f4cf -o ./data/output/tidywigits/0.0.7.9003/5025091088c1f4cf --ulid --prefix_include --input_id 5025091088c1f4cf
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509108edb21f8 -o ./data/output/tidywigits/0.0.7.9003/502509108edb21f8 --ulid --prefix_include --input_id 502509108edb21f8
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091090003861 -o ./data/output/tidywigits/0.0.7.9003/5025091090003861 --ulid --prefix_include --input_id 5025091090003861
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091095e30977 -o ./data/output/tidywigits/0.0.7.9003/5025091095e30977 --ulid --prefix_include --input_id 5025091095e30977
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091098bbd78e -o ./data/output/tidywigits/0.0.7.9003/5025091098bbd78e --ulid --prefix_include --input_id 5025091098bbd78e
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250910a1bd15fe -o ./data/output/tidywigits/0.0.7.9003/50250910a1bd15fe --ulid --prefix_include --input_id 50250910a1bd15fe
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250910a92af94f -o ./data/output/tidywigits/0.0.7.9003/50250910a92af94f --ulid --prefix_include --input_id 50250910a92af94f
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250910acc872ce -o ./data/output/tidywigits/0.0.7.9003/50250910acc872ce --ulid --prefix_include --input_id 50250910acc872ce
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250910b186a805 -o ./data/output/tidywigits/0.0.7.9003/50250910b186a805 --ulid --prefix_include --input_id 50250910b186a805
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250910b5c49068 -o ./data/output/tidywigits/0.0.7.9003/50250910b5c49068 --ulid --prefix_include --input_id 50250910b5c49068
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250910b8324300 -o ./data/output/tidywigits/0.0.7.9003/50250910b8324300 --ulid --prefix_include --input_id 50250910b8324300
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250910bb543e4c -o ./data/output/tidywigits/0.0.7.9003/50250910bb543e4c --ulid --prefix_include --input_id 50250910bb543e4c
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250910bd7802a2 -o ./data/output/tidywigits/0.0.7.9003/50250910bd7802a2 --ulid --prefix_include --input_id 50250910bd7802a2
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250910c6923fd7 -o ./data/output/tidywigits/0.0.7.9003/50250910c6923fd7 --ulid --prefix_include --input_id 50250910c6923fd7
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250910d5123c69 -o ./data/output/tidywigits/0.0.7.9003/50250910d5123c69 --ulid --prefix_include --input_id 50250910d5123c69
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250910d68e6794 -o ./data/output/tidywigits/0.0.7.9003/50250910d68e6794 --ulid --prefix_include --input_id 50250910d68e6794
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250910ec833cdb -o ./data/output/tidywigits/0.0.7.9003/50250910ec833cdb --ulid --prefix_include --input_id 50250910ec833cdb
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250910ff9c3005 -o ./data/output/tidywigits/0.0.7.9003/50250910ff9c3005 --ulid --prefix_include --input_id 50250910ff9c3005
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509110036e0ff -o ./data/output/tidywigits/0.0.7.9003/502509110036e0ff --ulid --prefix_include --input_id 502509110036e0ff
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091119daf4b5 -o ./data/output/tidywigits/0.0.7.9003/5025091119daf4b5 --ulid --prefix_include --input_id 5025091119daf4b5
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509112014a569 -o ./data/output/tidywigits/0.0.7.9003/502509112014a569 --ulid --prefix_include --input_id 502509112014a569
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250911256c51b2 -o ./data/output/tidywigits/0.0.7.9003/50250911256c51b2 --ulid --prefix_include --input_id 50250911256c51b2
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091128ffb34e -o ./data/output/tidywigits/0.0.7.9003/5025091128ffb34e --ulid --prefix_include --input_id 5025091128ffb34e
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091140a566fb -o ./data/output/tidywigits/0.0.7.9003/5025091140a566fb --ulid --prefix_include --input_id 5025091140a566fb
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509114491c731 -o ./data/output/tidywigits/0.0.7.9003/502509114491c731 --ulid --prefix_include --input_id 502509114491c731
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250911550e8d17 -o ./data/output/tidywigits/0.0.7.9003/50250911550e8d17 --ulid --prefix_include --input_id 50250911550e8d17
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091164523ed4 -o ./data/output/tidywigits/0.0.7.9003/5025091164523ed4 --ulid --prefix_include --input_id 5025091164523ed4
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509116548d906 -o ./data/output/tidywigits/0.0.7.9003/502509116548d906 --ulid --prefix_include --input_id 502509116548d906
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091173a55ee8 -o ./data/output/tidywigits/0.0.7.9003/5025091173a55ee8 --ulid --prefix_include --input_id 5025091173a55ee8
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091174058064 -o ./data/output/tidywigits/0.0.7.9003/5025091174058064 --ulid --prefix_include --input_id 5025091174058064
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091176b237f7 -o ./data/output/tidywigits/0.0.7.9003/5025091176b237f7 --ulid --prefix_include --input_id 5025091176b237f7
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091179035e70 -o ./data/output/tidywigits/0.0.7.9003/5025091179035e70 --ulid --prefix_include --input_id 5025091179035e70
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509117d81c101 -o ./data/output/tidywigits/0.0.7.9003/502509117d81c101 --ulid --prefix_include --input_id 502509117d81c101
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509118351b300 -o ./data/output/tidywigits/0.0.7.9003/502509118351b300 --ulid --prefix_include --input_id 502509118351b300
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250911981caabc -o ./data/output/tidywigits/0.0.7.9003/50250911981caabc --ulid --prefix_include --input_id 50250911981caabc
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250911aae07edb -o ./data/output/tidywigits/0.0.7.9003/50250911aae07edb --ulid --prefix_include --input_id 50250911aae07edb
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250911b102dd5d -o ./data/output/tidywigits/0.0.7.9003/50250911b102dd5d --ulid --prefix_include --input_id 50250911b102dd5d
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250911c39d9c46 -o ./data/output/tidywigits/0.0.7.9003/50250911c39d9c46 --ulid --prefix_include --input_id 50250911c39d9c46
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250911d04e59f6 -o ./data/output/tidywigits/0.0.7.9003/50250911d04e59f6 --ulid --prefix_include --input_id 50250911d04e59f6
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250911d5c76874 -o ./data/output/tidywigits/0.0.7.9003/50250911d5c76874 --ulid --prefix_include --input_id 50250911d5c76874
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250911d789f936 -o ./data/output/tidywigits/0.0.7.9003/50250911d789f936 --ulid --prefix_include --input_id 50250911d789f936
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250911dbae1942 -o ./data/output/tidywigits/0.0.7.9003/50250911dbae1942 --ulid --prefix_include --input_id 50250911dbae1942
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250911dc67e4ef -o ./data/output/tidywigits/0.0.7.9003/50250911dc67e4ef --ulid --prefix_include --input_id 50250911dc67e4ef
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250911e389080c -o ./data/output/tidywigits/0.0.7.9003/50250911e389080c --ulid --prefix_include --input_id 50250911e389080c
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250911e7c8507e -o ./data/output/tidywigits/0.0.7.9003/50250911e7c8507e --ulid --prefix_include --input_id 50250911e7c8507e
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250911eb4a58b6 -o ./data/output/tidywigits/0.0.7.9003/50250911eb4a58b6 --ulid --prefix_include --input_id 50250911eb4a58b6
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250911ee214c35 -o ./data/output/tidywigits/0.0.7.9003/50250911ee214c35 --ulid --prefix_include --input_id 50250911ee214c35
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250911f094f37b -o ./data/output/tidywigits/0.0.7.9003/50250911f094f37b --ulid --prefix_include --input_id 50250911f094f37b
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250911f5c702df -o ./data/output/tidywigits/0.0.7.9003/50250911f5c702df --ulid --prefix_include --input_id 50250911f5c702df
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091212c2d6d9 -o ./data/output/tidywigits/0.0.7.9003/5025091212c2d6d9 --ulid --prefix_include --input_id 5025091212c2d6d9
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509126c8f95dc -o ./data/output/tidywigits/0.0.7.9003/502509126c8f95dc --ulid --prefix_include --input_id 502509126c8f95dc
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509127e1e725b -o ./data/output/tidywigits/0.0.7.9003/502509127e1e725b --ulid --prefix_include --input_id 502509127e1e725b
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091287307208 -o ./data/output/tidywigits/0.0.7.9003/5025091287307208 --ulid --prefix_include --input_id 5025091287307208
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250912dc85f014 -o ./data/output/tidywigits/0.0.7.9003/50250912dc85f014 --ulid --prefix_include --input_id 50250912dc85f014
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250914430fbf52 -o ./data/output/tidywigits/0.0.7.9003/50250914430fbf52 --ulid --prefix_include --input_id 50250914430fbf52
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509144b314793 -o ./data/output/tidywigits/0.0.7.9003/502509144b314793 --ulid --prefix_include --input_id 502509144b314793
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509146e384e6c -o ./data/output/tidywigits/0.0.7.9003/502509146e384e6c --ulid --prefix_include --input_id 502509146e384e6c
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250914cf29419e -o ./data/output/tidywigits/0.0.7.9003/50250914cf29419e --ulid --prefix_include --input_id 50250914cf29419e
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250914f11aa851 -o ./data/output/tidywigits/0.0.7.9003/50250914f11aa851 --ulid --prefix_include --input_id 50250914f11aa851
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509154540f6b8 -o ./data/output/tidywigits/0.0.7.9003/502509154540f6b8 --ulid --prefix_include --input_id 502509154540f6b8
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250915daab2860 -o ./data/output/tidywigits/0.0.7.9003/50250915daab2860 --ulid --prefix_include --input_id 50250915daab2860
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916044e313a -o ./data/output/tidywigits/0.0.7.9003/50250916044e313a --ulid --prefix_include --input_id 50250916044e313a
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509160d0eecf1 -o ./data/output/tidywigits/0.0.7.9003/502509160d0eecf1 --ulid --prefix_include --input_id 502509160d0eecf1
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509160eec6513 -o ./data/output/tidywigits/0.0.7.9003/502509160eec6513 --ulid --prefix_include --input_id 502509160eec6513
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091611d8aeaf -o ./data/output/tidywigits/0.0.7.9003/5025091611d8aeaf --ulid --prefix_include --input_id 5025091611d8aeaf
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509161226941f -o ./data/output/tidywigits/0.0.7.9003/502509161226941f --ulid --prefix_include --input_id 502509161226941f
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091612c1cd63 -o ./data/output/tidywigits/0.0.7.9003/5025091612c1cd63 --ulid --prefix_include --input_id 5025091612c1cd63
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091616186bf0 -o ./data/output/tidywigits/0.0.7.9003/5025091616186bf0 --ulid --prefix_include --input_id 5025091616186bf0
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091616ed8e0e -o ./data/output/tidywigits/0.0.7.9003/5025091616ed8e0e --ulid --prefix_include --input_id 5025091616ed8e0e
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916189d6678 -o ./data/output/tidywigits/0.0.7.9003/50250916189d6678 --ulid --prefix_include --input_id 50250916189d6678
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509161e8d15db -o ./data/output/tidywigits/0.0.7.9003/502509161e8d15db --ulid --prefix_include --input_id 502509161e8d15db
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509161ed2f471 -o ./data/output/tidywigits/0.0.7.9003/502509161ed2f471 --ulid --prefix_include --input_id 502509161ed2f471
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091623382794 -o ./data/output/tidywigits/0.0.7.9003/5025091623382794 --ulid --prefix_include --input_id 5025091623382794
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916289e2508 -o ./data/output/tidywigits/0.0.7.9003/50250916289e2508 --ulid --prefix_include --input_id 50250916289e2508
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509162b0dda14 -o ./data/output/tidywigits/0.0.7.9003/502509162b0dda14 --ulid --prefix_include --input_id 502509162b0dda14
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509162dc5bd0e -o ./data/output/tidywigits/0.0.7.9003/502509162dc5bd0e --ulid --prefix_include --input_id 502509162dc5bd0e
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509162edca473 -o ./data/output/tidywigits/0.0.7.9003/502509162edca473 --ulid --prefix_include --input_id 502509162edca473
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091633a2a3cd -o ./data/output/tidywigits/0.0.7.9003/5025091633a2a3cd --ulid --prefix_include --input_id 5025091633a2a3cd
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091634f14b5a -o ./data/output/tidywigits/0.0.7.9003/5025091634f14b5a --ulid --prefix_include --input_id 5025091634f14b5a
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916394a6499 -o ./data/output/tidywigits/0.0.7.9003/50250916394a6499 --ulid --prefix_include --input_id 50250916394a6499
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509163c648c6e -o ./data/output/tidywigits/0.0.7.9003/502509163c648c6e --ulid --prefix_include --input_id 502509163c648c6e
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509164c45782d -o ./data/output/tidywigits/0.0.7.9003/502509164c45782d --ulid --prefix_include --input_id 502509164c45782d
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509164faf20ab -o ./data/output/tidywigits/0.0.7.9003/502509164faf20ab --ulid --prefix_include --input_id 502509164faf20ab
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091656b5de33 -o ./data/output/tidywigits/0.0.7.9003/5025091656b5de33 --ulid --prefix_include --input_id 5025091656b5de33
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091659da4ed5 -o ./data/output/tidywigits/0.0.7.9003/5025091659da4ed5 --ulid --prefix_include --input_id 5025091659da4ed5
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509165b445c1d -o ./data/output/tidywigits/0.0.7.9003/502509165b445c1d --ulid --prefix_include --input_id 502509165b445c1d
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509165f284b1f -o ./data/output/tidywigits/0.0.7.9003/502509165f284b1f --ulid --prefix_include --input_id 502509165f284b1f
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091661010674 -o ./data/output/tidywigits/0.0.7.9003/5025091661010674 --ulid --prefix_include --input_id 5025091661010674
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091663295d7b -o ./data/output/tidywigits/0.0.7.9003/5025091663295d7b --ulid --prefix_include --input_id 5025091663295d7b
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916649164c9 -o ./data/output/tidywigits/0.0.7.9003/50250916649164c9 --ulid --prefix_include --input_id 50250916649164c9
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091666ceb7d6 -o ./data/output/tidywigits/0.0.7.9003/5025091666ceb7d6 --ulid --prefix_include --input_id 5025091666ceb7d6
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091667e9feaf -o ./data/output/tidywigits/0.0.7.9003/5025091667e9feaf --ulid --prefix_include --input_id 5025091667e9feaf
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509166c6cf3fc -o ./data/output/tidywigits/0.0.7.9003/502509166c6cf3fc --ulid --prefix_include --input_id 502509166c6cf3fc
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509166f3c1000 -o ./data/output/tidywigits/0.0.7.9003/502509166f3c1000 --ulid --prefix_include --input_id 502509166f3c1000
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916740bd482 -o ./data/output/tidywigits/0.0.7.9003/50250916740bd482 --ulid --prefix_include --input_id 50250916740bd482
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091679fb20a2 -o ./data/output/tidywigits/0.0.7.9003/5025091679fb20a2 --ulid --prefix_include --input_id 5025091679fb20a2
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509167e579e4f -o ./data/output/tidywigits/0.0.7.9003/502509167e579e4f --ulid --prefix_include --input_id 502509167e579e4f
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091682a11ca4 -o ./data/output/tidywigits/0.0.7.9003/5025091682a11ca4 --ulid --prefix_include --input_id 5025091682a11ca4
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509168ab6bd42 -o ./data/output/tidywigits/0.0.7.9003/502509168ab6bd42 --ulid --prefix_include --input_id 502509168ab6bd42
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502509169027ef2c -o ./data/output/tidywigits/0.0.7.9003/502509169027ef2c --ulid --prefix_include --input_id 502509169027ef2c
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091692de8497 -o ./data/output/tidywigits/0.0.7.9003/5025091692de8497 --ulid --prefix_include --input_id 5025091692de8497
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/5025091698797d07 -o ./data/output/tidywigits/0.0.7.9003/5025091698797d07 --ulid --prefix_include --input_id 5025091698797d07
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916a59eb8c9 -o ./data/output/tidywigits/0.0.7.9003/50250916a59eb8c9 --ulid --prefix_include --input_id 50250916a59eb8c9
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916a60b0481 -o ./data/output/tidywigits/0.0.7.9003/50250916a60b0481 --ulid --prefix_include --input_id 50250916a60b0481
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916adb49bae -o ./data/output/tidywigits/0.0.7.9003/50250916adb49bae --ulid --prefix_include --input_id 50250916adb49bae
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916aedbfd7d -o ./data/output/tidywigits/0.0.7.9003/50250916aedbfd7d --ulid --prefix_include --input_id 50250916aedbfd7d
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916afe841ff -o ./data/output/tidywigits/0.0.7.9003/50250916afe841ff --ulid --prefix_include --input_id 50250916afe841ff
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916bd57c30d -o ./data/output/tidywigits/0.0.7.9003/50250916bd57c30d --ulid --prefix_include --input_id 50250916bd57c30d
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916bfa6341e -o ./data/output/tidywigits/0.0.7.9003/50250916bfa6341e --ulid --prefix_include --input_id 50250916bfa6341e
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916c23fe0c9 -o ./data/output/tidywigits/0.0.7.9003/50250916c23fe0c9 --ulid --prefix_include --input_id 50250916c23fe0c9
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916c3388207 -o ./data/output/tidywigits/0.0.7.9003/50250916c3388207 --ulid --prefix_include --input_id 50250916c3388207
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916c99068e8 -o ./data/output/tidywigits/0.0.7.9003/50250916c99068e8 --ulid --prefix_include --input_id 50250916c99068e8
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916c9b826df -o ./data/output/tidywigits/0.0.7.9003/50250916c9b826df --ulid --prefix_include --input_id 50250916c9b826df
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916cc20835c -o ./data/output/tidywigits/0.0.7.9003/50250916cc20835c --ulid --prefix_include --input_id 50250916cc20835c
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916cdc0713a -o ./data/output/tidywigits/0.0.7.9003/50250916cdc0713a --ulid --prefix_include --input_id 50250916cdc0713a
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916ce7877f2 -o ./data/output/tidywigits/0.0.7.9003/50250916ce7877f2 --ulid --prefix_include --input_id 50250916ce7877f2
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916cf98e459 -o ./data/output/tidywigits/0.0.7.9003/50250916cf98e459 --ulid --prefix_include --input_id 50250916cf98e459
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916d363d611 -o ./data/output/tidywigits/0.0.7.9003/50250916d363d611 --ulid --prefix_include --input_id 50250916d363d611
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916d7ca895f -o ./data/output/tidywigits/0.0.7.9003/50250916d7ca895f --ulid --prefix_include --input_id 50250916d7ca895f
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916dab449e9 -o ./data/output/tidywigits/0.0.7.9003/50250916dab449e9 --ulid --prefix_include --input_id 50250916dab449e9
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916edd690e9 -o ./data/output/tidywigits/0.0.7.9003/50250916edd690e9 --ulid --prefix_include --input_id 50250916edd690e9
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916f21579fa -o ./data/output/tidywigits/0.0.7.9003/50250916f21579fa --ulid --prefix_include --input_id 50250916f21579fa
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916f4abd2c7 -o ./data/output/tidywigits/0.0.7.9003/50250916f4abd2c7 --ulid --prefix_include --input_id 50250916f4abd2c7
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50250916fb56c639 -o ./data/output/tidywigits/0.0.7.9003/50250916fb56c639 --ulid --prefix_include --input_id 50250916fb56c639
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502510150600e2f1 -o ./data/output/tidywigits/0.0.7.9003/502510150600e2f1 --ulid --prefix_include --input_id 502510150600e2f1
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502510156d97f28a -o ./data/output/tidywigits/0.0.7.9003/502510156d97f28a --ulid --prefix_include --input_id 502510156d97f28a
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502510159153db0e -o ./data/output/tidywigits/0.0.7.9003/502510159153db0e --ulid --prefix_include --input_id 502510159153db0e
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502511241ff9dedc -o ./data/output/tidywigits/0.0.7.9003/502511241ff9dedc --ulid --prefix_include --input_id 502511241ff9dedc
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/502511248cb43efa -o ./data/output/tidywigits/0.0.7.9003/502511248cb43efa --ulid --prefix_include --input_id 502511248cb43efa
echo
time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/50251209ec473840 -o ./data/output/tidywigits/0.0.7.9003/50251209ec473840 --ulid --prefix_include --input_id 50251209ec473840
echo
echo ----------------
date
