const { Configuration, OpenAIApi } = require("openai");

const configuration = new Configuration({
    apiKey: process.env.OPENAI_API_KEY,
});
const openai = new OpenAIApi(configuration);

const generateImage = async (req, res) => {
    const { prompt, size } = req.body;

    // const imageSize = size === 'small' ? '256x256' : size === 'medium' ? '512x512' : '1024x1024';
    try {
        const response = await openai.createImage({
            prompt: prompt,
            n: 2,
            size: '512x512',
        })

        const imageUrl1 = response.data.data[0].url
        const imageUrl2 = response.data.data[1].url


        res.status(200).json({
            // success: true,
            text: 'image created',
            data1: imageUrl1,
            data2: imageUrl2
        });
    } catch (error) {
        if (error.response) {
            console.log(error.response.status);
            console.log(error.response.data);
        } else {
            console.log(error.message);
        }
        res.status(400).json({
            success: false,
            error: 'image could not be generated'
        });
    }
}

module.exports = { generateImage }