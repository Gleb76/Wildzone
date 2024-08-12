MODULE="Modules/KinopoiskAPI/Sources/KinopoiskAPI"

openapi-generator generate -i "film.yaml" -g swift5 -o "film"
rm -rf "$MODULE"*
cp -R "film/OpenAPIClient/Classes/OpenAPIs/" "$MODULE"
rm -rf "film"

