function parse (items, start) {
    const result = [];
    for (i = start;i-start < items.length; i++) {
        result.push(
`            <Key ID="STR_RT_SPECTATOR_Quote_${i}">
                <English>${items[i - start][1]}</English>
                <Russian>${items[i - start][0]}</Russian>
            </Key>
            <Key ID="STR_RT_SPECTATOR_Quote_Author_${i}">
                <English>${items[i - start][3]}</English>
                <Russian>${items[i - start][2]}</Russian>
            </Key>`
        )
    }

    return result.join('\n')
}