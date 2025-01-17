function parse(data) {

const result = data.map((x, i) => {
    return `            <Key ID="STR_RT_SPECTATOR_Quote_${i + 1}">
                <English>${x['Quote'].replaceAll('\n', '\\')}</English>
                <Russian>${x['Цитатки'].replaceAll('\n', '\\')}</English>
            </Key>
            <Key ID="STR_RT_SPECTATOR_Quote_Author_${i + 1}">
                <English>${x['Author'].replaceAll('\n', '\\')}</English>
                <Russian>${x['Автор'].replaceAll('\n', '\\')}</English>
            </Key>

`
})
    
return result.join('')
}