type CardProps = {
    heading?: string;
    description?: string;
    Image?: React.ReactNode;
};

export default function CardComponent({ Image, heading, description }: CardProps) {
    return (
        <div>
            <div className="bg-white p-4 rounded-lg shadow-lg" style={{ maxWidth: '350px' }}>
                <div className="text-center">{Image}</div>
                <h3 className="font-bold text-xl text-blue-500">{heading}</h3>
                <p>{description}</p>
            </div>
        </div>
    );
}
