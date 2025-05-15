interface CreateIconProps {
    iconKey: string;
}

export const CreateIcon = ({ iconKey }: CreateIconProps) => {
    return <img src={`/icons/${iconKey}.svg`} alt={iconKey} onError={(e) => {
        e.currentTarget.src = '/icons/default.svg';
        e.currentTarget.alt = 'default';
        e.currentTarget.onerror = null;
    }}/>;
};

export default CreateIcon;
